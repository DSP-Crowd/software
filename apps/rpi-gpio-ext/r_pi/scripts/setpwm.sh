#!/bin/bash

id=$(printf "%02x" $1)

# pv = period value
phex=$(printf "%08x" $2)
pv3=${phex:0:2}
pv2=${phex:2:2}
pv1=${phex:4:2}
pv0=${phex:6:2}

# dv = duty cycle value
dhex=$(printf "%08x" $3)
dv3=${dhex:0:2}
dv2=${dhex:2:2}
dv1=${dhex:4:2}
dv0=${dhex:6:2}

echo -ne "\x$id\x02\x$pv3\x$pv2\x$pv1\x$pv0\x$dv3\x$dv2\x$dv1\x$dv0" > /dev/spidev0.3
#echo "cmd: $id 02 $pv3 $pv2 $pv1 $pv0 $dv3 $dv2 $dv1 $dv0"
