#!/bin/bash

cpu=$(/usr/sbin/iostat -o -c 2 | tail -1 | awk '{print $6}' | cut -d. -f 1)
temp=$(/Users/sweda/.rbenv/versions/2.3.3/bin/istats cpu | awk '{print $3}')

printf "%s%% : %s\n" $(( 100 - $cpu )) $temp

