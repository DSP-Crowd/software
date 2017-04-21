#!/bin/bash

pin_nr=4

if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

if [ ! -d "/sys/class/gpio/gpio${pin_nr}" ]; then
	echo ${pin_nr} > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio${pin_nr}/direction
fi

if [ "$1" = "true" ]; then
	echo 1 > /sys/class/gpio/gpio${pin_nr}/value
	echo "gpio4 on"
else
	echo 0 > /sys/class/gpio/gpio${pin_nr}/value
	echo "gpio4 off"
fi
