#!/bin/sh

python $(dirname $0)/spiarray.py "$@" | tr [a-z] [A-Z]
