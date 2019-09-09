#!/bin/bash

/usr/local/bin/docker-entrypoint.sh &
sleep 30
python3.6 application.py &
sleep 10
news-please
