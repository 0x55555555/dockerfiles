#!/bin/bash
apt-get update

apt install -y -qq --no-install-recommends libqt5core5a libqt5gui5 libqt5widgets5 qt5-qmake qtbase5-dev-tools

mkdir qt_pkg
cd qt_pkg
apt download qtbase5-dev
dpkg --force-all -i qtbase5-dev*.deb
cd ..

# We dont need gl... but qt wants it.which 
mkdir -p /usr/include/libdrm/GL/
touch /usr/include/libdrm/GL/gl.h

rm -r \
  qt_pkg \
  /usr/share/qt5 \
  /usr/lib/x86_64-linux-gnu/dri/* \
  /usr/lib/x86_64-linux-gnu/perl/* \
  /usr/lib/x86_64-linux-gnu/libLLVM-4.0.so*


rm -rf /var/lib/apt/lists/*