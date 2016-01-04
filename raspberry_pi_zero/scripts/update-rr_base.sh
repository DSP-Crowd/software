#!/bin/sh

mdev=/dev/mtd0
rfile=rr_base.bin

flash_erase ${mdev} 0 6
dd if=${rfile} of=${mdev}
cmp ${mdev} ${rfile}
