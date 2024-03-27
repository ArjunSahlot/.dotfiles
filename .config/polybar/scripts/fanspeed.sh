#!/usr/bin/env bash

speed=$(sensors | grep cpu_fan | awk '{print $2; exit}')

if [ "$speed" != "" ]; then
    echo "$speed RPM"
else
   echo "N/A"
fi
