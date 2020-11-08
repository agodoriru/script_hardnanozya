#!/bin/bash

interval=5

# deamons[index]="<hoge>"
deamons[0]="httpd"
deamons[1]="named"

while :
do
    for deamon in ${deamons[@]}
    do
        sudo systemctl status $deamon | grep "Active" | grep "inactive"

        if [ "${PIPESTATUS[2]}" -eq 0 ] ; then
            datetime="$(date "+%Y/%m/%d %H:%M:%S")"
            echo "    ${deamon} down detected,${datetime}"
            echo "    reloading"
            sudo systemctl start $deamon
        else
            message="${deamon} active"
            echo $message
        fi
    done
    sleep $interval 
done
~
~
~
