#!/bin/bash

red=${1:0:2}
green=${1:2:2}
blue=${1:4:2}

#echo "Color: $red $green $blue"

echo -ne "\x3F\x02\x00\x00\x00\xFF\x00\x00\x00\x$red" > /dev/spidev0.3
echo -ne "\x3D\x02\x00\x00\x00\xFF\x00\x00\x00\x$green" > /dev/spidev0.3
echo -ne "\x3C\x02\x00\x00\x00\xFF\x00\x00\x00\x$blue" > /dev/spidev0.3
