#!/bin/bash

id=$(printf "%02x" $1)

vhex=$(printf "%08x" $2)
val3=${vhex:0:2}
val2=${vhex:2:2}
val1=${vhex:4:2}
val0=${vhex:6:2}

#echo "Servo ID: $id"
#echo "Value: $val3 $val2 $val1 $val0"

echo -ne "\x$id\x02\x00\x0F\x42\x40\x$val3\x$val2\x$val1\x$val0" > /dev/spidev0.3
