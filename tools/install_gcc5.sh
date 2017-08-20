#!/bin/sh
apt-get update

apt install -y -qq --no-install-recommends software-properties-common ca-certificates
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update

# Install gcc 7 binaries
apt install -y -qq --no-install-recommends \
  gcc-5 \
  g++-5 

# Update selection
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-5

apt-get -qq purge --auto-remove -y software-properties-common
rm -rf /var/lib/apt/lists/*
