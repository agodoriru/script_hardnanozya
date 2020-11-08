#!/bin/bash

echo "monitoring"

# cp -r /var/www/
while :
do
echo " ================= "
    for dir in /var/www/* ;
    do
        sudo find $dir -mmin -1 -ls
        FILE=`echo ${LINE} | awk '{print $11}'`
        diff ${FILE}
        sleep 3 
    done 
done 
