#!/bin/bash

tail -f /var/log/secure | grep "sshd" | grep "from" | grep "Failed"
~
~
