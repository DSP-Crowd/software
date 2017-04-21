#!/bin/bash

id=$(printf "%02x" $1)

#echo "GPIO ID: $id"

script=$(dirname $0)/../../../../_install/r_pi/scripts/spiarray.py
#echo "Script: $script"

valfull=$(python $script $id 00 00)
val=${valfull:5:1}

#echo "Value full: $valfull"
#echo "Value:      $val"

echo -n "$val"
