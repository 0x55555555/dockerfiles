#!/bin/sh

mkdir -p /opt/cppcheck
cd /opt/cppcheck

wget -q https://github.com/danmar/cppcheck/archive/1.79.tar.gz

tar -zxvf 1.79.tar.gz
cd cppcheck-1.79

make CFGDIR=/opt/cppcheck/cppcheck-1.79/cfg CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" 
ln -s /opt/cppcheck/cppcheck-1.79/cppcheck /usr/bin/cppcheck