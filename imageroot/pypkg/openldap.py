#
# Copyright (C) 2025 Nethesis S.r.l.
# SPDX-License-Identifier: GPL-3.0-or-later
#

"""openldap.py - helper library to import/export users for RFC2307 schema.

For export_users():
  - returns list of user records with keys: user, display_name, locked,
    groups, mail, must_change_password (always False), no_password_expiration (always False)
    (password is never exported).

For import_users(records, skip_existing, progfunc):
  - records list items may contain: user (required), display_name, password,
    locked, groups list, mail. Other AD-only flags ignored.
  - When skip_existing is True existing users are skipped.
  - progfunc receives percentage progress (0-100).

"""

import subprocess
import os
import sys
import base64


LDAP_DOMAIN = os.environ['LDAP_DOMAIN']
LDAP_SUFFIX = os.environ['LDAP_SUFFIX']

# Map of array indexes returned by _make_record():
ACDN = 0
ACMEMBERS = 1
ACUAC = 2
ACID = 3
ACGROUPS = 4
ACTYPE = 5
ACDISPLAY = 6
ACMAIL = 7
ACPWDLASTSET = 8

def export_users() -> list:
    # ldapcli returns: user, groups, ... plus optional attrs
    out = []
    adb = _get_accounts()
    for u in adb.values():
        if u[ACTYPE] != 'U':
            continue
        out.append({
            'user': u[ACID],
            'display_name': u[ACDISPLAY] or "",
            'locked': bool(u[ACUAC]),
            'groups': u[ACGROUPS],
            'mail': u[ACMAIL] or "",
            'must_change_password': False,
            'no_password_expiration': False,
        })
    return out

class CaseInsensitiveDict(dict):
    """Dict subclass with case-insensitive key lookup.

    Limitations:
    - Only string keys are supported; non-string keys will fail on .lower().
    - Methods other than __setitem__, __getitem__, and __contains__
      remain case-sensitive (get, pop, setdefault, update, etc.).
    - Iteration yields lower-cased keys since stored keys are normalized.
    - Keys that differ only by case are merged silently.
    """
    def __setitem__(self, key, value):
        super().__setitem__(key.lower(), value)

    def __getitem__(self, key):
        return super().__getitem__(key.lower())

    def __contains__(self, key):
        return super().__contains__(key.lower())

def import_users(records: list, skip_existing: bool, progfunc) -> bool:
    errors = 0
    total = len(records) or 1
    done = 0
    adb = _get_accounts()
    new_groups = set()
    def _create_missing_groups(groups, user):
        # Create missing groups on the fly:
        for g in groups:
            if g not in adb and g.lower() not in new_groups:
                try:
                    subprocess.run(['podman', 'exec', 'openldap', 'add-group', g], stdout=sys.stderr, text=True, check=True)
                    new_groups.add(g.lower())
                except subprocess.CalledProcessError:
                    errors += 1
    for rec in records:
        user = rec['user']
        groups = rec.get('groups', [])
        password = rec.get('password')
        display_name = rec.get('display_name')
        mail = rec.get('mail')
        if user in adb:
            if skip_existing:
                done += 1
                continue
            _create_missing_groups(groups, user)
            # build alter-user command for merging attributes
            alt_cmd = ['podman', 'exec', '-i', 'openldap', 'alter-user']
            if 'password' in rec:
                alt_cmd += ['-e', '-p', '-'] # ignore password-change errors
            if 'groups' in rec and groups:
                alt_cmd += ['-g', ','.join(groups)]
            if 'display_name' in rec and display_name:
                alt_cmd += ['-d', display_name]
            if 'locked' in rec:
                alt_cmd += ['-l'] if rec['locked'] else ['-u']
            if 'mail' in rec and mail:
                alt_cmd += ['-m', mail]
            alt_cmd.append(user)
            try:
                subprocess.run(alt_cmd, input=password, stdout=sys.stderr, check=True, text=True)
            except subprocess.CalledProcessError:
                errors += 1
        else:
            _create_missing_groups(groups, user)
            # Add a new user
            add_cmd = ['podman', 'exec', '-i', 'openldap', 'add-user']
            if groups:
                add_cmd += ['-g', ','.join(groups)]
            if password:
                add_cmd += ['-p', '-']
            else:
                add_cmd += ['-p', '']
                password = None
            if display_name:
                add_cmd += ['-d', display_name]
            if mail:
                add_cmd += ['-m', mail]
            add_cmd.append(user)
            try:
                subprocess.run(add_cmd, input=password, stdout=sys.stderr, check=True, text=True)
                # lock status adjustment if specified (add-user handled only create)
                if rec.get('locked') is not None:
                    desired_locked = bool(rec.get('locked'))
                    lock_cmd = ['podman', 'exec', '-i', 'openldap', 'alter-user', '-l' if desired_locked else '-u', user]
                    subprocess.run(lock_cmd, stdout=sys.stderr, text=True, check=True)
            except subprocess.CalledProcessError:
                errors += 1
        done += 1
        progfunc(int(done * 100 / total))
    progfunc(100)
    return errors == 0

def _get_accounts() -> dict:
    """Returns users and groups. Each dict value is a list of 9 elements.
    """
    def v(line):
        a, v = line.split(": ", 1)
        if a.endswith(":"):
            try:
                return base64.b64decode(v).decode("utf-8", errors="ignore")
            except Exception:
                pass
        return v

    def _make_record():
        record = list((None,)*9)
        record[ACGROUPS] = []
        record[ACMEMBERS] = []
        record[ACTYPE] = 'U'
        record[ACUAC] = 0
        return record

    accounts = CaseInsensitiveDict()
    with subprocess.Popen([
            'podman', 'exec', 'openldap', 'ldapsearch',
            '-b', LDAP_SUFFIX,
            '-o', 'ldif-wrap=no',
            '(|(objectClass=posixAccount)(objectClass=posixGroup))',
            'uid',
            'cn',
            'sn',
            'memberUid',
            'pwdAccountLockedTime',
            'pwdChangedTime',
            'objectClass',
            'mail',
            'displayName',
        ], text=True, stdout=subprocess.PIPE) as proc_ldapsearch:
            record = _make_record()
            curdn = None
            curcn = None
            curna = None
            for ldifline in proc_ldapsearch.stdout:
                ldifline = ldifline.rstrip("\n")
                if not ldifline:
                    # End-Of-Record
                    if record[ACTYPE] == 'G' and curcn:
                        curna = curcn # identify group with cn attribute
                    record[ACID] = curna
                    if curna and curdn:
                        accounts[curna] = record
                    record = _make_record()
                    curdn = None
                    curcn = None
                    curna = None
                elif ldifline.startswith("dn:"):
                    curdn = v(ldifline)
                    record[ACDN] = curdn
                elif ldifline.startswith("uid:"):
                    curna = v(ldifline)
                elif ldifline.startswith("cn:"):
                    curcn = v(ldifline)
                elif ldifline.startswith("memberUid:"):
                    record[ACMEMBERS].append(v(ldifline))
                elif ldifline == "objectClass: posixGroup":
                    record[ACTYPE] = 'G'
                elif ldifline.startswith("pwdAccountLockedTime:"):
                    if v(ldifline) == '000001010000Z':
                        record[ACUAC] = 1 # Locked
                    else:
                        record[ACUAC] = 0 # Unlocked
                elif ldifline.startswith("displayName:"):
                    record[ACDISPLAY] = v(ldifline)
                elif ldifline.startswith("mail:"):
                    record[ACMAIL] = v(ldifline)
                elif ldifline.startswith("pwdChangedTime:"):
                    try:
                        record[ACPWDLASTSET] = v(ldifline)
                    except ValueError:
                        # Ignore invalid pwdChangedTime values; leave as None
                        pass
    # Fill group list of individual user records:
    group_iter = filter(lambda a: a[ACTYPE] == 'G', accounts.values())
    for g in group_iter:
        for u in g[ACMEMBERS]:
            if u in accounts:
                accounts[u][ACGROUPS].append(g[ACID])
    if proc_ldapsearch.returncode != 0:
        print("[ERROR] ldapsearch failed!", file=sys.stderr)
        return CaseInsensitiveDict()
    return accounts
