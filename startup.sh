#!/bin/bash

/usr/local/bin/docker-entrypoint.sh &
sleep 20
python3.6 application.py &
sleep 10
news-please > /dev/null 2>&1 &
sleep 10
