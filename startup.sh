#!/bin/bash

/usr/local/bin/docker-entrypoint.sh &
sleep 20
python3.6 application.py &
sleep 10
python3.6 -m pip install --upgrade elasticsearch
python3.6 -m pip install --upgrade urllib3
news-please
