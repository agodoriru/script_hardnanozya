#!/bin/bash

while :
do
    sudo systemctl status httpd | grep "Active" | grep "inactive"
    if [ "${PIPESTATUS[2]}" -eq 0 ] ; then
        datetime="$(date "+%Y/%m/%d %H:%M:%S")"
        echo "    down detected,${datetime}"
        echo "    reloading"
        sudo systemctl start httpd
    else
        echo "active"
    fi
    sleep 5
done
~
~
~
