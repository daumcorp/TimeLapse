#!/bin/sh
detected_device=$(gphoto2 --auto-detect | grep Canon)
if test -z "$detected_device"; then
	echo "Device not connected!"
	exit 1
fi
DIR=/home/pi/public_html/lapse
mkdir -p $DIR/logs
cd $DIR
## take picture
/usr/bin/gphoto2 \
--quiet \
--capture-image-and-download \
--hook-script=$DIR/gphoto2-hook-script.sh \
--filename "G6_%Y%m%d-%H%M-%f.%C" \
>> $DIR/logs/gphoto2.log 2>&1
