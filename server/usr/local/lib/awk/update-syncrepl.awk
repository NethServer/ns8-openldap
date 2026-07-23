#!/usr/bin/awk

#
# Copyright (C) 2022 Nethesis S.r.l.
# http://www.nethesis.it - nethserver@nethesis.it
#
# This file is part of NethServer.
#
# NethServer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License,
# or any later version.
#
# NethServer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#

#
# Remove server "targetid" from the syncrepl configuration and emit the
# resulting LDIF on stdout.
#
# The replication agreements pointing at a server are matched by their rid,
# which is derived deterministically from the server id (see entrypoint.sh):
#   config rid = targetid * 2
#   data   rid = targetid * 2 + 1
# Matching by rid (instead of the provider URL taken from the olcServerID
# entry) makes the removal work even when the olcServerID entry is already
# gone, e.g. after the graceful leave-domain path ran first.
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
    if (servers_left < 2) {
        # Only one server will remain: drop replication entirely
        print "dn: " lastdn
        print "changetype: modify"
        print "replace: olcSyncrepl"
        print "-"
        print "replace: olcMultiProvider" "\n"
        # Turn on the flag to skip remaining lines of the current dn entry:
        skipentry = 1
        next
    } else if ($0 ~ ("}rid=" config_rid " ") || $0 ~ ("}rid=" data_rid " ")) {
        # Expunge the syncrepl agreement of targetid only
        print "dn: " lastdn
        print "changetype: modify"
        print "delete: olcSyncrepl"
        print $0 "\n"
    }
}
