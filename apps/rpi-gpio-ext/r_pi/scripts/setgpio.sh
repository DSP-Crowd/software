#!/bin/bash

id=$(printf "%02x" $1)
val=$(printf "%02x" $2)

#echo "GPIO ID: $id"
#echo "Value: $val"

echo -ne "\x$id\x01\x$val" > /dev/spidev0.3
