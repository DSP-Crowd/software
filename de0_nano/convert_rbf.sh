#!/bin/sh

mkdir -p output

cp project/output_files/tbd_rr_base.rbf output/rr_base.rbf
python reverse_bits.py output/rr_base.rbf > output/rr_base.bin
md5sum output/rr_base.bin
