#!/bin/bash

id=$1

# pv = period value
pv3=${2:0:2}
pv2=${2:2:2}
pv1=${2:4:2}
pv0=${2:6:2}

# dv = duty cycle value
dv3=${3:0:2}
dv2=${3:2:2}
dv1=${3:4:2}
dv0=${3:6:2}

echo -ne "\x$id\x02\x$pv3\x$pv2\x$pv1\x$pv0\x$dv3\x$dv2\x$dv1\x$dv0" > /dev/spidev0.3
#echo "cmd: $id 02 $pv3 $pv2 $pv1 $pv0 $dv3 $dv2 $dv1 $dv0"
