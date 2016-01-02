# rr_base

Base components for project redRocket.

Used hardware:
- DE0 Nano
- Raspberry Pi Zero

This repository includes one project for each board
- DE0 Nano
  - Providing the SPI of the EPCS64 configuration chip on the DE0 Nano via pin header
  - Reconfiguration support. A short pulse on one pin triggers the reconfiguration
  - Two different LED blink sequences
- Raspberry Pi Zero
  - GPIO pulse generator
  - DTS file for EPCS64
