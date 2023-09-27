#!/bin/bash

set -B
set -x
ld=0

while [ "${ld} -ne 1" ]; do
    dd if=/dev/zero of=/dev/null &
    ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`    
done
