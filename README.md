# DSP-Crowd

Software for the Raspberry Pi to DE0 Nano connector

## Used hardware ##

- DE0 Nano
- One of the following Raspberry Pis
  - Raspberry Pi Zero
  - Raspberry Pi Zero W
  - Raspberry Pi 1 Model A+
  - Raspberry Pi 1 Model B+
  - Raspberry Pi 2 Model B
  - Raspberry Pi 3 Model B

## Initial setup ##

1. Power up the system
   1. Connect an USB Micro B cable to the connector board. We recommend the official Raspberry Pi power supply as source
   2. If you use a Raspberry Pi 1 Model B+ you also need to connect an USB Micro B cable to the Raspberry Pi while it is booting. After that you can remove this cable
2. Copy the device tree overlay file `_hello-world/raspberry_pi_zero/dts/overlays/dspc-de0_nano.dtbo` from the repository to the directory `/boot/overlays` on your Raspberry Pi
3. On your Raspberry Pi
   1. Add the line `dtoverlay=dspc-de0_nano` in /boot/config.txt
   2. Install the mtd-utils package with `sudo apt-get install mtd-utils`
   3. Restart the Pi with 'reboot'
   4. After the reboot you should see a device called `mtd0` in the directory `/dev`. Note: We assume a fresh Raspbian OS. If you already use another hardware extension it may not work as described here
```
pi@raspberrypi:~ $ ls -l /dev/mtd0
crw------- 1 root root 90, 0 Mar 29 23:17 /dev/mtd0
```
4. For the initial setup you also need to connect your DE0 Nano to the PC because the initial design must be downloaded with Quartus
5. On your PC
   1. Download the initial design file `_hello-world/de0_nano/output/rr_base.sof` to your DE0 Nano board with Quartus
6. On your Raspberry Pi
   1. Program the flash on the DE0 Nano board. See "Programming the DE0 Nano after the initial setup"
7. After that you can remove the cable on the DE0 Nano. You will never need it again

## Programming the DE0 Nano after the initial setup ##

1. On your Raspberry Pi. Download the hello world designs for the FPGA:
   1. `wget https://github.com/DSP-Crowd/software/blob/master/_hello-world/de0_nano/output/rr_base.bin` .. Slow blinking hello world led
   2. `wget https://github.com/DSP-Crowd/software/blob/master/_hello-world/de0_nano/output/rr_base-fast.bin` .. Fast blinking hello world led
