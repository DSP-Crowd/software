#!/bin/sh

pin_nr=24

echo 1 > /sys/class/gpio/gpio${pin_nr}/value
echo 0 > /sys/class/gpio/gpio${pin_nr}/value
