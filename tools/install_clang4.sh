#!/bin/sh
apt-get update

apt install -y -qq --no-install-recommends software-properties-common ca-certificates
echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main" >> /etc/sources.list.d/llvm.list

wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
apt-get update

apt-get install clang-4.0 lld-4.0

apt-get -qq purge --auto-remove -y software-properties-common
rm -rf /var/lib/apt/lists/*
