#!/bin/sh

python spiarray.py "$@" | tr [a-z] [A-Z]
