#!/usr/bin/awk

#
# Copyright (C) 2022 Nethesis S.r.l.
# http://www.nethesis.it - nethserver@nethesis.it
#
# This script is part of NethServer.
#
# NethServer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License,
# or any later version.
#
# NethServer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with NethServer.  If not, see COPYING.
#

#
# Remove one or more servers from the syncrepl configuration.
#
# This awk filter reads the current configuration database and prints an LDIF
# script that removes server and syncrepl entries for the servers listed in
# "targetid", a space-separated list of server IDs.
#
# Output ordering matters: deleting the config DB olcSyncrepl or the olcServerID
# restarts the cn=config syncrepl consumer on every peer (rc -100 quitting), so
# anything written after that may never reach them. Emit least- to
# most-disruptive:
#   1. data DB (mdb) olcSyncrepl
#   2. config DB olcSyncrepl
#   3. olcServerID
#
# All targets must be handled in a single run: servers_left is meaningful only
# when counted against the whole target list, and the ordering above holds only
# within one output stream.
#

BEGIN {
    split(targetid, targetlist, " ")
    for (i in targetlist) {
        target[targetlist[i]] = 1
    }
}

/^dn: / {
    lastdn = $2
    # When a new entry is found turn off the skip flag:
    skipentry = 0
}

{
    if (skipentry) {
        next
    }
}

/^olcServerID: / {
    servers_left++
    if ($2 in target) {
        provmatch[" provider=" $3 " "] = 1
        # One record per value: ldapmodify -c fails a record as a whole, so
        # keeping them separate stays idempotent when a peer already dropped
        # one of the values (the rc 16 tolerated by remove-server).
        serverid_ldif = serverid_ldif "dn: cn=config\nchangetype: modify\ndelete: olcServerID\n" $0 "\n\n"
        servers_left--
    }
}

/^olcSyncrepl: / {
    if (servers_left < 2) {
        # Last provider standing: an empty replace clears the whole attribute,
        # so one value per entry is enough.
        rec = "dn: " lastdn "\nchangetype: modify\nreplace: olcSyncrepl\n-\nreplace: olcMultiProvider\n\n"
        if (lastdn ~ /mdb/) {
            wipe_mdb_ldif = wipe_mdb_ldif rec
        } else {
            wipe_config_ldif = wipe_config_ldif rec
        }
        # Turn on the flag to skip remaining lines of the current dn entry:
        skipentry = 1
        next
    }
    for (pm in provmatch) {
        if ($0 ~ pm) {
            # Expunge syncrepl config for the target servers only.
            rec = "dn: " lastdn "\nchangetype: modify\ndelete: olcSyncrepl\n" $0 "\n\n"
            if (lastdn ~ /mdb/) {
                mdb_ldif = mdb_ldif rec
            } else {
                config_ldif = config_ldif rec
            }
            next
        }
    }
}

END {
    printf "%s", wipe_mdb_ldif
    printf "%s", wipe_config_ldif
    printf "%s", mdb_ldif
    printf "%s", config_ldif
    printf "%s", serverid_ldif
}
