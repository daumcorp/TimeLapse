#!/bin/bash
## every 15mins, check log and downloaded files
DIR=/home/pi/public_html/lapse
a=`tail -1 $DIR/logs/gphoto2.log`
#echo $a
q="IMG"
b=${q}${a#*${q}}
#echo $b
d=`expr ${b:4:4} - 1`
e="IMG_$d.JPG"
#e="IMG_1901.JPG"
if [[ "$e" == *01.JPG ]]
then
	echo "ok!"
f=$(/usr/bin/gphoto2 -L | grep $e | awk '{print $1}' | cut -b 2-10)

if [ -z "$f" ]
then
        echo "not exists on camera $e"
        exit 0
fi

env LANG=C /usr/bin/gphoto2 \
--quiet \
--get-file=$f \
--hook-script=$DIR/gphoto2-hook-script.sh \
--filename "G6_%Y%m%d-%H%M-%f.%C" \
>> $DIR/logs/gphoto2.log 2>&1

## tail -2 logs/gphoto2.log | head -1 ## to acquire folder name

g=`tail -2 $DIR/logs/gphoto2.log | head -1` ## "Downloading 'IMG_1801.JPG' from folder '/store_00010001/DCIM/118CANON'..."
h="store"
i=${h}${g#*${h}}
j=/${i:0:28}

env LANG=C /usr/bin/gphoto2 --delete-file=1 --folder=$j >> $DIR/logs/gphoto2-delete.log

fi

exit 0

