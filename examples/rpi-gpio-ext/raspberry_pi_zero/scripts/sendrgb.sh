#!/bin/bash

redid=$1
greenid=$2
blueid=$3

redval=${4:0:2}
greenval=${4:2:2}
blueval=${4:4:2}

#echo "IDs: $redid $greenid $blueid"
#echo "Color: $redval $greenval $blueval"

echo -ne "\x$redid\x02\x00\x00\xFF\x00\x00\x00\x$redval\x00" > /dev/spidev0.3
echo -ne "\x$greenid\x02\x00\x00\xFF\x00\x00\x00\x$greenval\x00" > /dev/spidev0.3
echo -ne "\x$blueid\x02\x00\x00\xFF\x00\x00\x00\x$blueval\x00" > /dev/spidev0.3
