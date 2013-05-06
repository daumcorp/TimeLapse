#!/bin/sh

self=`basename $0`

case "$ACTION" in
    init)
#        echo "$self: INIT"
        # exit 1 # non-null exit to make gphoto2 call fail
        ;;
    start)
#        echo "$self: START"
        ;;
    download)
        echo "$(date '+%Y-%m-%d %T') hook : download to $ARGUMENT"
	scp $ARGUMENT ezhong@ezc:~/public_html/lapse/pics/original && rm -rf $ARGUMENT 
        ;;
    stop)
#        echo "$self: STOP"
        ;;
    *)
#        echo "$self: Unknown action: $ACTION"
        ;;
esac

exit 0
