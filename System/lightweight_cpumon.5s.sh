#!/bin/bash

IFS_=$IFS

# should only have to fork twice, everything else shell internals
iostat=( `/usr/sbin/iostat -o -c 2` )
istats=( `/Users/sweda/.rbenv/versions/2.3.3/bin/istats cpu` )

if [ ${#iostat[@]} -eq 31 ]; then
    idle=${iostat[27]}
    IFS=. idle_int=( $idle )
    IFS=$IFS_
    cpu=$(( 100 - $idle_int ))"%"
else
    cpu="n/a"
fi

if [ ${#istats[@]} -eq 4 ]; then
    temp=${istats[2]}
else
    temp="n/a"
fi

echo "$cpu : $temp\n"

