#!/bin/sh

pin_nr=24

echo ${pin_nr} > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio${pin_nr}/direction
