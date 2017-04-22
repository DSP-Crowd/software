#!/bin/sh

mdev=/dev/mtd0

if [ "$1" = "" ]; then
	rfile=../../de0_nano/output/rr_base.bin
else
	rfile=$1
fi

if [ ! -f ${rfile} ]; then
	exit 1
fi

flash_erase ${mdev} 0 6
dd if=${rfile} of=${mdev}

cmp ${mdev} ${rfile} -n $(wc -c ${rfile} | cut -d " " -f 1)
if [ $? -eq 0 ]; then
	$(dirname $0)/fpga-reconf.sh
	exit 0
else
	exit 2
fi
