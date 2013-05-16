#!/bin/bash
(! ping -c1 172.16.172.1 > /dev/null 2>&1) && /home/pi/public_html/lapse/restart_network.sh
