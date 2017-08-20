#!/bin/bash
apt-get update

apt install -y --no-install-recommends python3 python3-dev
wget https://bootstrap.pypa.io/get-pip.py 
python3 get-pip.py 

rm -rf /var/lib/apt/lists/*
rm get-pip.py
rm /usr/bin/python3.5m
rm /usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython*