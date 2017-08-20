#!/bin/bash
apt-get update

apt install -y --no-install-recommends python3 python3-dev
wget https://bootstrap.pypa.io/get-pip.py 
python3 get-pip.py 

rm -rf /var/lib/apt/lists/*