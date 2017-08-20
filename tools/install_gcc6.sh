#!/bin/sh
apt-get update

apt install -y -qq --no-install-recommends software-properties-common ca-certificates
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update

# Install gcc 7 binaries
apt install -y -qq --no-install-recommends \
  gcc-6 \
  g++-6 

# Update selection
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-6

apt-get -qq purge --auto-remove -y software-properties-common
rm -rf /var/lib/apt/lists/*
