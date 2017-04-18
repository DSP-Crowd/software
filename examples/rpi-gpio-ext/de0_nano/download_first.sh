#!/bin/sh

cp project/output_files/tbd_rr_base.sof output/rr_base.sof
quartus_pgm --mode=jtag -o p\;output/rr_base.sof
