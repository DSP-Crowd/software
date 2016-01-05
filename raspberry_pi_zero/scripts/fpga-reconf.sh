#!/bin/sh

pin_nr=24

if [ ! -d "/sys/class/gpio/gpio${pin_nr}" ]; then
	echo ${pin_nr} > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio${pin_nr}/direction
fi

echo 1 > /sys/class/gpio/gpio${pin_nr}/value
echo 0 > /sys/class/gpio/gpio${pin_nr}/value
