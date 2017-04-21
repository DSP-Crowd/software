
import sys
import time
import spidev

spi = spidev.SpiDev()
spi.open(0, 3)
spi.max_speed_hz=5000000

argc = len(sys.argv)

if argc < 2:
	print "Error: No arguments specified"
	print ""
	print "Usage: spitest.py <hex-bytearray>"
	sys.exit(1)

data = [int(x, 16) for x in sys.argv[1:]]

resp = spi.xfer2(data)
resp_hex = str(bytearray(resp)).encode('hex')
print resp_hex
