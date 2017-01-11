#!/bin/bash
# lightweight cpu/temp/fan monitor
# only forks twice, everything else shell internals
# smc executable created from smc.c in iStats gem

IFS_=$IFS
iostat=( `/usr/sbin/iostat -n 0 -dC -c 2` )
smc=( `/Users/sweda/bin/smc` )

if [[ ${#iostat[@]} -eq 10 ]]; then
    idle=${iostat[9]}
    # ensure integer so that bash math won't bomb
    IFS=. idle_int=( $idle )
    IFS=$IFS_
    cpu="$(( 100 - $idle_int ))%"
else
    cpu="n/a"
fi

if [[ ${#smc[@]} -eq 26 ]]; then
    temp="${smc[1]}${smc[2]}"
    fan="${smc[6]} ${smc[7]}"
    echo "$cpu : $temp : $fan"
else
    temp="$cpu : n/a"
fi


