#!/bin/bash

echo "Starting elasticsearch server"
/usr/local/bin/docker-entrypoint.sh &
echo "waiting 30 seconds"
sleep 30
echo "starting elsaticsearchHQ"
python3.6 application.py &
echo "waiting 20 seconds"
sleep 20
news-please > /dev/null 2>&1 &
echo "starting crawler"
sleep 20
news-please
