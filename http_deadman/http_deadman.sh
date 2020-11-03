## Original https://qiita.com/Kakimoty_Field/items/754df3a181187fbb517c

#!/bin/sh

## Example: sh sh_checkurl.sh http://example.com checkurl.log 10
### Check status of http://example.com every 10 seconds and save the result into ./checkurl.log
## $1 = Target URL list
## $2 = Log Txt Filename (path from shell script)


# Interval seconds
IntervalSec=60

target=$1

if [ $1 = "help" ]; then
echo "sh http_deadman.sh http_deadman.conf LOGFILENAME"
exit
fi

if [ $# -gt 3 ]; then
 exit 0
fi

logFilename=$2

while :
do
    cat $1 | while read line
	do
            datetime="$(date "+%Y/%m/%d %H:%M:%S")"
            message=`curl -o /dev/null -s -w %{http_code} $line`
<<COMMENTOUT
	    if [ $message = 200 ]
	    then
		echo "OK"
	    else
		echo "NG"
	    fi
COMMENTOUT
            message_="${datetime},${message},${line}"
            echo ${message_} >> ${logFilename}
            echo ${message_}
	    sleep 1
        done
    sleep ${IntervalSec}
done
