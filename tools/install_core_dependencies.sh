#!/bin/bash
apt-get update

# Install tools
apt-get install -y -qq --no-install-recommends \
  wget \
  libunwind8-dev \
  ca-certificates \
  make

# Install cmake 3.9.1
wget https://cmake.org/files/v3.9/cmake-3.9.1-Linux-x86_64.sh
chmod +x ./cmake-3.9.1-Linux-x86_64.sh

mkdir -p /opt/cmake
./cmake-3.9.1-Linux-x86_64.sh --skip-license --prefix=/opt/cmake

ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
ln -s /opt/cmake/bin/cpack /usr/local/bin/cpack
ln -s /opt/cmake/bin/ctest /usr/local/bin/ctest

# Prune useless parts of cmake in build image.
rm -r /opt/cmake/doc
rm -r /opt/cmake/man
rm -r /opt/cmake/bin/cmake-gui

rm ./cmake-3.9.1-Linux-x86_64.sh
rm -rf /var/lib/apt/lists/*