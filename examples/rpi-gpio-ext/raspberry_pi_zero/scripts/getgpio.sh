#!/bin/bash

id=$1

#echo "GPIO ID: $id"

script=$(dirname $0)/spiarray.py
#echo "Script: $script"

valfull=$(python $script $id 00 00)
val=${valfull:5:1}

#echo "Value full: $valfull"
#echo "Value:      $val"

echo -n "$val"
