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
# Remove servers "targetids" from the syncrepl configuration.
#
# This awk filter reads the current configuration database and prints an LDIF
# script that removes server and syncrepl entries for the given "targetids"
# (space-separated list of server IDs).
#

BEGIN {
    n = split(targetids, tarr)
    for (i = 1; i <= n; i++) targetset[tarr[i]] = 1
}

/^dn: / {
    lastdn = $2
    # When a new entry is found turn off the skip flag:
    skipentry = 0
    # Control the op header to delete some values of multi-value attribute:
    emitdelete = 1
}

{
    if (skipentry) {
        next
    }
}

/^olcServerID: / {
    servers_left++
    if ($2 in targetset) {
        providermatches[nmatch++] = " provider=" $3 " "
        if(emitdelete) {
            print ""
            print "dn: cn=config"
            print "changetype: modify"
            print "delete: olcServerID"
            emitdelete = 0
        }
        print $0
        servers_left--
    }
}

/^olcSyncrepl: / {
    if (servers_left < 2) {
        # Remove replication attributes
        print ""
        print "dn: " lastdn
        print "changetype: modify"
        print "replace: olcSyncrepl"
        print "-"
        print "replace: olcMultiProvider"
        # Turn on the flag to skip remaining lines of the current dn entry:
        skipentry = 1
        next
    } else {
        # Expunge syncrepl config for each target server
        for (i in providermatches) {
            if (index($0, providermatches[i])) {
                if(emitdelete) {
                    print ""
                    print "dn: " lastdn
                    print "changetype: modify"
                    print "delete: olcSyncrepl"
                    emitdelete = 0
                }
                print $0
                break
            }
        }
    }
}
