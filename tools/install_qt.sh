#!/bin/bash
apt-get update

mkdir qt_pkg
cd qt_pkg
apt download qtbase5-dev
dpkg --force-all -i qtbase5-dev*.deb
#apt install -y -qq --no-install-recommends libqt5core5a libqt5gui5 libqt5widgets5
cd ..

rm -r \
  qt_pkg \
  /usr/share/qt5

rm -rf /var/lib/apt/lists/*