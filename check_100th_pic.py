#!/usr/bin/python
import sys
import subprocess as sub

filename = sys.argv[1]
if not filename.endswith("02.JPG"):
	sys.exit(1)

f = 'IMG_%s.JPG' % str(int(filename[4:-4])-1)
print f

output = subprocess.check_output(["/usb/bin/gphoto2 -L | grep 'IMG_1801.JPG' | awk '{print $1}' | cut -b 2-10"]);
print output


## range_number = /usb/bin/gphoto2 -L | grep 'IMG_1801.JPG' | awk '{print $1}' | cut -b 2-10
