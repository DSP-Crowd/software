#!/bin/bash

id=$1
val3=${2:0:2}
val2=${2:2:2}
val1=${2:4:2}
val0=${2:6:2}

#echo "Servo ID: $id"
#echo "Value: $val3 $val2 $val1 $val0"

echo -ne "\x$id\x02\x00\x0F\x42\x40\x$val3\x$val2\x$val1\x$val0" > /dev/spidev0.3
