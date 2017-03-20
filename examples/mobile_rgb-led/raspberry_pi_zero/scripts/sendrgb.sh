#!/bin/bash

pin_nr=4
scriptname="$(dirname $0)/spiarray.py"
param=$1
red=${param:0:2}
green=${param:2:2}
blue=${param:4:2}
rgb="$red $green $blue"

#echo $scriptname
#echo "sendrgb.sh: input is '$param'"
echo "sendrgb.sh: rgb is '$rgb'"

echo ". Output is: "
python $scriptname 00 00 $rgb | tr [a-z] [A-Z]
