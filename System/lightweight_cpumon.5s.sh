#!/bin/bash
# lightweight cpu/temp/fan monitor
# only forks twice, everything else shell internals
# smc executable created from smc.c in iStats gem

IFS_=$IFS
iostat=( `/usr/sbin/iostat -o -c 2` )
smc=( `/Users/sweda/bin/smc` )

if [ ${#iostat[@]} -eq 31 ]; then
    idle=${iostat[27]}
    IFS=. idle_int=( $idle )
    IFS=$IFS_
    cpu="$(( 100 - $idle_int ))%"
else
    cpu="n/a"
fi

if [ ${#smc[@]} -eq 26 ]; then
    temp="${smc[1]}${smc[2]}"
    fan="${smc[6]} ${smc[7]}"
    echo "$cpu : $temp : $fan"
else
    temp="$cpu : n/a"
fi


