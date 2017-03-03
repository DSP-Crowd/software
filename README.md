# DSP-Crowd

Base components for the Raspberry Pi Zero to DE0 Nano connector

Used hardware
- DE0 Nano
- Raspberry Pi Zero

This repository includes one project for each board
- DE0 Nano
  - Provide the SPI of the EPCS64 configuration chip on the DE0 Nano via pin header
  - Reconfiguration support. A short pulse on one pin triggers the reconfiguration of the FPGA
  - Test two different LED blink sequences
- Raspberry Pi Zero
  - GPIO pulse generator
  - DTS file for EPCS64

Status
- All done

Installation on Raspberry Pi Zero

$ wget https://github.com/DSP-Crowd/software/raw/master/install.sh
$ sudo ./install.sh
