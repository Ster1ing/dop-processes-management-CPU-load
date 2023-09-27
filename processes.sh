#!/bin/bash

set -B
set -x

fulload() {
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null &
};

ld=0

while [ "${ld} -ne 1" ]; do
    fulload
    ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`    
done
