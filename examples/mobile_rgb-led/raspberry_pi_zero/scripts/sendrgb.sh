#!/bin/bash

pin_nr=4
scriptname="$(dirname $0)/spiarray.py"
param=$(cat /home/pi/param)
red=${param:1:2}
green=${param:3:2}
blue=${param:5:2}
rgb="$red $green $blue"

#echo $scriptname
#echo "sendrgb.sh: input is '$param'"
echo "sendrgb.sh: rgb is '$rgb'"

echo ". Output is: "
echo 0 > /sys/class/gpio/gpio${pin_nr}/value
python $scriptname $rgb | tr [a-z] [A-Z]
echo 1 > /sys/class/gpio/gpio${pin_nr}/value
