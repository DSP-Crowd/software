#!/bin/bash

id=$1
val=$2

#echo "GPIO ID: $id"
#echo "Value: $val"

echo -ne "\x$id\x01\x$val" > /dev/spidev0.3
