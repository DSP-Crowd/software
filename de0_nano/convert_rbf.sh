#!/bin/sh

mkdir -p output

python reverse_bits.py project/output_files/tbd_rr_base.rbf > output/rr_base.bin
md5sum output/rr_base.bin
