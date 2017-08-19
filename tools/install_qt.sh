#!/bin/bash

apt install -y qtbase5-dev

rm -r \
  /usr/lib/x86_64-linux-gnu/dri \
  /usr/lib/x86_64-linux-gnu/libLLVM-4.0.so.1 \
  /usr/lib/x86_64-linux-gnu/qt5 \
  /usr/share