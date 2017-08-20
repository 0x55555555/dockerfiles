#!/bin/sh
apt-get update

apt install -y -qq --no-install-recommends software-properties-common ca-certificates
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update

# Install gcc 7 binaries
apt install -y -qq --no-install-recommends \
  gcc-7 \
  g++-7 

# Update selection
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-7

apt-get -qq purge --auto-remove -y software-properties-common
rm -rf /var/lib/apt/lists/*

# hack out lto... not a great idea, but smaller image...?
rm /usr/lib/gcc/x86_64-linux-gnu/7/lto1
