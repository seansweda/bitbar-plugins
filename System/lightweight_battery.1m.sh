#!/bin/bash
# lightweight battery monitor
# only forks once, everything else shell internals

IFS_=$IFS
IFS=$'\n;' pmset=( `pmset -g rawbatt` )

if [ ${#pmset} -eq 17 ]; then
    eval ${pmset[6]}
    IFS=: hours=( $Time )
    IFS=$'\n;'
    if [ $hours -gt 24 ]; then
	echo "∞"
	echo "---"
	echo $Time
    else
	echo $Time
	echo "---"
    fi
    echo ${pmset[3]}
    echo ${pmset[2]}
    echo ${pmset[4]}
    echo ${pmset[8]}
    IFS=$IFS_
else
    echo "n/a"
fi

