#!/bin/sh

if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

wget -nc -P /boot/overlays https://github.com/DSP-Crowd/software/raw/master/raspberry_pi_zero/dts/overlays/dspc-de0_nano.dtbo
#echo "dtoverlay=dspc-de0_nano" >> /boot/config.txt

apt-get install mtd-utils

wget -nc https://github.com/DSP-Crowd/software/raw/master/de0_nano/output/rr_base.bin
wget -nc https://github.com/DSP-Crowd/software/raw/master/raspberry_pi_zero/scripts/fpga-reconf.sh
wget -nc https://github.com/DSP-Crowd/software/raw/master/raspberry_pi_zero/scripts/update-fpga.sh

chmod +x fpga-reconf.sh
chmod +x update-fpga.sh
