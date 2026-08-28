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
#
# Output ordering matters: deleting the config DB olcSyncrepl or the olcServerID
# restarts the cn=config syncrepl consumer on every peer (rc -100 quitting), so
# anything written after that may never reach them. Emit least- to
# most-disruptive:
#   1. data DB (mdb) olcSyncrepl
#   2. config DB olcSyncrepl
#   3. olcServerID
#

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
        providermatch = " provider=" $3 " "
        serverid_ldif = "dn: cn=config\nchangetype: modify\ndelete: olcServerID\n" $0 "\n\n"
        servers_left--
    }
}

/^olcSyncrepl: / {
    if (servers_left < 2) {
        # Last provider standing: an empty replace clears the whole attribute,
        # so one value per entry is enough.
        wipe_ldif[lastdn] = "dn: " lastdn "\nchangetype: modify\nreplace: olcSyncrepl\n-\nreplace: olcMultiProvider\n\n"
        # Turn on the flag to skip remaining lines of the current dn entry:
        skipentry = 1
        next
    } else if (providermatch && $0 ~ providermatch) {
        # Expunge syncrepl config for targetid only.
        rec = "dn: " lastdn "\nchangetype: modify\ndelete: olcSyncrepl\n" $0 "\n\n"
        if (lastdn ~ /mdb/) {
            mdb_ldif = mdb_ldif rec
        } else {
            config_ldif = config_ldif rec
        }
    }
}

END {
    for (dn in wipe_ldif) {
        printf "%s", wipe_ldif[dn]
    }
    printf "%s", mdb_ldif
    printf "%s", config_ldif
    printf "%s", serverid_ldif
}
