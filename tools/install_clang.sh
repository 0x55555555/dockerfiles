#!/bin/bash

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Error: invalid version specified $*";
  exit 1;
fi

VERSION_NUMBER="${VERSION}.0"

apt-get update

apt install -y -qq --no-install-recommends software-properties-common ca-certificates
mkdir -p /etc/sources.list.d/
echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-${VERSION_NUMBER} main" >> /etc/sources.list.d/llvm.list

wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
apt-get update

apt-get install -y -qq --no-install-recommends \
  clang-${VERSION_NUMBER} \
  lld-${VERSION_NUMBER}

# Update selection
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${VERSION_NUMBER} 60 \
    --slave /usr/bin/clang++ clang++ /usr/bin/clang++-${VERSION_NUMBER}


apt-get -qq purge --auto-remove -y software-properties-common
rm -rf /var/lib/apt/lists/*
