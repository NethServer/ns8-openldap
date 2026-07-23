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
# Remove server "targetid" from the syncrepl configuration.
#
# This awk filter reads the current configuration database and prints an LDIF
# script that removes server and syncrepl entries for the given "targetid".
# Syncrepl entries are matched by rid (config rid = targetid * 2, data rid + 1),
# so removal works even when the olcServerID entry is already gone.
#

BEGIN {
    config_rid = targetid * 2
    data_rid = config_rid + 1
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
    if (targetid == $2) {
        print "dn: cn=config"
        print "changetype: modify"
        print "delete: olcServerID"
        print $0 "\n"
        servers_left--
    }
}

/^olcSyncrepl: / {
    if(servers_left < 2) {
        # Remove replication attributes
        print "dn: " lastdn
        print "changetype: modify"
        print "replace: olcSyncrepl"
        print "-"
        print "replace: olcMultiProvider" "\n"
        # Turn on the flag to skip remaining lines of the current dn entry:
        skipentry = 1
        next
    } else if ($0 ~ ("}rid=" config_rid " ") || $0 ~ ("}rid=" data_rid " ")) {
        # Expunge syncrepl config for targetid only
        print "dn: " lastdn
        print "changetype: modify"
        print "delete: olcSyncrepl"
        print $0 "\n"
    }
}
