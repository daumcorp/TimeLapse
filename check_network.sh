#!/bin/bash
(! ping -c1 172.16.172.1 > /dev/null 2>&1) && ifdown wlan0 && sleep 5 && ifup wlan0
