#!/bin/bash

pin_nr=4

echo #abcdef
echo labcdef

if [ "$1" = "true" ]; then
	echo 1 > /sys/class/gpio/gpio${pin_nr}/value
	echo "gpio4 on"
else
	echo 0 > /sys/class/gpio/gpio${pin_nr}/value
	echo "gpio4 off"
fi
