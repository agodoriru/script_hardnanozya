#!/bin/bash

#need change
user=root
database=wordpress

mkdir Backups

echo "start backup"
date="$(date "+%y-%m-%d-%H:%M:%S")"
echo $date


dir="${date}-Backup"
echo $dir

mkdir ./Backups/$dir
cp -r /var/www/html ./Backups/${dir}
mysqldump -u $user $database > ./Backups/${dir}/dump.sql
