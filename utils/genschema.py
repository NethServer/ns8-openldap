#
# Copyright (C) 2024 Nethesis S.r.l.
# SPDX-License-Identifier: GPL-3.0-or-later
#

import ldap3
import sys
import json
import agent
import os

from agent.ldapproxy import Ldapproxy

#
# Fetch the LDAP schema and dump it as a Python dictionary The output of
# this script is useful to build a Python schema conversion filter, to
# migrate from an NS6-LDAP to NS8.
# 

def print_schema_pydict():
    lp = Ldapproxy()

    config = lp.get_domain(os.environ["LDAP_DOMAIN"])
    server = ldap3.Server(config['host'],port=int(config['port']), get_info=ldap3.ALL)
    conn = ldap3.Connection(server, user=config["bind_dn"], password=config["bind_password"], auto_bind=True)

    print("ns8schema = {")
    for cl in server.schema.object_classes:
        co = ldap3.ObjectDef([cl], conn)
        print("  " + repr(cl) + ': ' + repr([x.name for x in co]) + ",")
    print("}")

if __name__ == '__main__':
    print_schema_pydict()
