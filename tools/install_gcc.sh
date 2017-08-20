#!/bin/sh
VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Error: invalid version specified $*";
  exit 1;
fi

apt-get update

apt install -y -qq --no-install-recommends software-properties-common ca-certificates
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update

# Install gcc binaries
apt install -y -qq --no-install-recommends \
  gcc-${VERSION} \
  g++-${VERSION} 

# Update selection
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${VERSION} 60 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-${VERSION}

apt-get -qq purge --auto-remove -y software-properties-common
rm -rf /var/lib/apt/lists/*

# hack out lto... not a great idea, but smaller image...?
rm /usr/lib/gcc/x86_64-linux-gnu/${VERSION}/lto1
