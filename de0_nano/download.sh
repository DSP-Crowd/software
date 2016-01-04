#!/bin/sh

#quartus_pgm --mode=jtag -o p\;project/output_files/tbd_rr_base.sof
scp output/rr_base.bin root@$1:/root/rr_base.bin
