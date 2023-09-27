#!/bin/bash

set -B
set -x

fulload() {
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null &
};

fulload; 
ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`
echo $ld

fulload; 
ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`
echo $ld

fulload; 
ld=`cat /proc/loadavg | echo "$(awk -F " " '{ print $1 }') > 50" | bc`
echo $ld
