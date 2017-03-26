# DSP-Crowd

Software for the Raspberry Pi to DE0 Nano connector

Used hardware
- DE0 Nano
- One of the following Raspberry Pis
  - Raspberry Pi Zero
  - Raspberry Pi Zero W
  - Raspberry Pi 1 Model A+
  - Raspberry Pi 1 Model B+
  - Raspberry Pi 2 Model B
  - Raspberry Pi 3 Model B

Initial setup
1. Power up the system
   1. Connect a USB Micro B cable to the connector board. We recommend the official Raspberry Pi power supply as source
   2. If you use a Raspberry Pi 1 Model B+ you also need to connect a USB Micro B cable to the Raspberry Pi while it is booting. After that you can remove this cable
2. Copy the device tree overlay file _hello-world/raspberry_pi_zero/dts/overlays/dspc-de0_nano.dtbo from the repository to the directory /boot/overlays on your Raspberry Pi
3. On your Raspberry Pi
   1. Add the line `dtoverlay=dspc-de0_nano` in /boot/config.txt
   2. Install the mtd-utils package with 'sudo apt-get install mtd-utils'
   3. Restart the Pi with 'reboot'
4. For the initial setup you also need to connect your DE0 Nano to the PC because the initial design must be downloaded with Quartus
5. On your PC
   1. Download the initial design file _hello-world/de0_nano/output/rr_base.sof to your DE0 Nano board
6. On your Raspberry Pi
   1. ..

Programming the DE0 Nano after the initial setup
1. 
