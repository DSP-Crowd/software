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
   1. If you use a Raspberry Pi 1 Model B+ you also need to connect an USB Micro B cable to the Raspberry Pi while it is booting. After that you can remove this cable
1. Copy the device tree overlay file `_hello-world/raspberry_pi_zero/dts/overlays/dspc-de0_nano.dtbo` from the repository to the directory `/boot/overlays` on your Raspberry Pi
1. On your Raspberry Pi
   1. Add the line `dtoverlay=dspc-de0_nano` in `/boot/config.txt`
   1. Install the mtd-utils package with `sudo apt-get install mtd-utils`
   1. Restart the Pi with `reboot`
   1. After the reboot you should see a device called `mtd0` in the directory `/dev`. Note: We assume a fresh Raspbian OS. If you already use another hardware extension it may not work as described here
```
pi@raspberrypi:~ $ ls -l /dev/mtd0
crw------- 1 root root 90, 0 Mar 29 23:17 /dev/mtd0
```
4. For the initial setup you also need to connect your DE0 Nano to the PC because the initial design must be downloaded with Quartus
1. On your PC
   1. Download the initial design file `_hello-world/de0_nano/output/rr_base.sof` to your DE0 Nano board with Quartus
1. On your Raspberry Pi
   1. Program the flash on the DE0 Nano board. See "Programming the DE0 Nano after the initial setup"
1. After that you can remove the cable on the DE0 Nano. You will never need it again

## Programming the DE0 Nano after the initial setup ##

1. On your Raspberry Pi
   1. Download the hello world designs for the FPGA:
      1. `wget https://github.com/DSP-Crowd/software/blob/master/_hello-world/de0_nano/output/rr_base.bin` .. Slow blinking hello world led
      1. `wget https://github.com/DSP-Crowd/software/blob/master/_hello-world/de0_nano/output/rr_base-fast.bin` .. Fast blinking hello world led
   1. Clear the flash device, which is on the DE0 Nano FPGA board
```
pi@raspberrypi:~ $ sudo flash_erase /dev/mtd0 0 6
Erasing 64 Kibyte @ 50000 -- 100 % complete
```
   3. Program the flash device
```
pi@raspberrypi:~ $ sudo dd if=rr_base.bin of=/dev/mtd0
411+1 records in
411+1 records out
210480 bytes (210 kB) copied, 0.973143 s, 216 kB/s
```
   4. Check if the flash device contains your file from the Raspberry Pi. If you see EOF (which means End Of File), then everything is fine! :)
```
pi@raspberrypi:~ $ sudo cmp rr_base.bin /dev/mtd0
cmp: EOF on rr_base.bin
```
   5. If something went wrong it looks like this:
```
pi@raspberrypi:~ $ sudo flash_erase /dev/mtd0 0 6
Erasing 64 Kibyte @ 50000 -- 100 % complete
pi@raspberrypi:~ $ sudo cmp rr_base.bin /dev/mtd0
rr_base.bin /dev/mtd0 differ: byte 33, line 1
```
