for a in `seq 1 254`; do
    ping -c 1 -w 3 172.16.0.$a > /dev/null;

    if [ $? -eq 0 ]; then
            echo $a
    fi
done
