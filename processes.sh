#!/bin/bash

set -B
set -x

fulload() {
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null &
};

fulload; 
ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`

echo $ld

while [ "${ld} -ne 1" ]; do
    sleep 5
    ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`
    echo "ld - $ld"
done
