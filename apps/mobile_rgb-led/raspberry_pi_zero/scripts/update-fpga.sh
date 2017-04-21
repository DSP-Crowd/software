#!/bin/sh

mdev=/dev/mtd0

if [ "$1" = "" ]; then
	rfile=rr_base.bin
else
	rfile=$1
fi

flash_erase ${mdev} 0 6
dd if=${rfile} of=${mdev}
cmp ${mdev} ${rfile}

$(dirname $0)/fpga-reconf.sh
