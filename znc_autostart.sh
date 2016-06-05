#!/bin/bash
#
# ZNC autostart script
# reference: https://goo.gl/DMI8dD
# 
# Copyleft: Adnan Hodzic <adnan@hodzic.org>

znc_autostart(){
pscheck="$(ps -ef |  grep -v grep | grep znc | awk \"{print $2}\")"
runznc="/volume1/@appstore/znc/bin/znc &"

if [ ! -n "$pscheck" ]; then
    eval $runznc
fi
}

export -f znc_autostart
su admin -c "znc_autostart"
