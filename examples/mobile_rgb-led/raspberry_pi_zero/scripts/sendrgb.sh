#!/bin/bash

red=${1:0:2}
green=${1:2:2}
blue=${1:4:2}

echo -ne "\x00\x00\x$red\x$green\x$blue" > /dev/spidev0.3
