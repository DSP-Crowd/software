#!/bin/bash

id=$(printf "%02x" $1)
val=$(printf "%02x" $2)

#echo "ID: $id"
#echo "Value: $val"

echo -ne "\x$id\x02\x00\x00\xFF\x00\x00\x00\x$val\x00" > /dev/spidev0.3
