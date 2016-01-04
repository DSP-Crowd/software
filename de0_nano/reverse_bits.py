
import sys

argc = len(sys.argv)

if argc < 2:
	print "Error: No arguments specified"
	print ""
	print "Usage: convert_rbf.py <file>"
	sys.exit(1)

f = open(sys.argv[1], "rb")

try:
	data = f.read()
	for byte in data:
		ibyte = ord(byte)
		rbyte = int('{0:08b}'.format(ibyte)[::-1], 2)
		sys.stdout.write(chr(rbyte))
finally:
	f.close()
