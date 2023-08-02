#!/bin/bash

types=$(cat /sys/class/thermal/thermal_zone*/type)
temps=$(cat /sys/class/thermal/thermal_zone*/temp)
num=$(echo $temps | tr -cd ' ' | wc -c)

for (( i=1; i<($num+1); i++)); do
    type=$(echo $types | cut -d " " -f $i)
    tempraw=$(echo $temps | cut -d " " -f $i)
    tempround="${tempraw:0:2}"
    echo -e "$type\t\t$tempround\xe2\x84\x83"
done