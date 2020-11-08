#!/bin/bash

trap 'echo "down"; rm -f *.log; exit 1' 1 2 3 15 

interval=5


cat /var/log/secure | grep "sshd" | grep "from" | grep "Failed" > failed.log
cat /var/log/secure | grep "sshd" | grep "from" | grep "Accepted" > accepted.log

while :
do
    sudo cat /var/log/secure | grep "sshd" | grep "from" | grep "Accepted" > tmp_accepted.log
    diff accepted.log tmp_accepted.log
    mv tmp_accepted.log accepted.log


    sudo cat /var/log/secure | grep "sshd" | grep "from" | grep "Failed" > tmp_failed.log
    diff failed.log tmp_failed.log
    mv tmp_failed.log failed.log

    sleep $interval 
done
~
~
tail -f /var/log/secure
