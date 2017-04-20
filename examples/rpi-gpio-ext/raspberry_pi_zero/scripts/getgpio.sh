#!/bin/bash

id=$1

#echo "GPIO ID: $id"

valfull=$(python spiarray.py $id 00 00)
val=${valfull:5:1}

#echo "Value full: $valfull"
#echo "Value:      $val"

echo $val
