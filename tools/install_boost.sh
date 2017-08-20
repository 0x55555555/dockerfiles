#!/bin/bash

TOOLSET=$1
if [ -z "$TOOLSET" ]; then
  echo "Error: invalid toolset specified $*";
  exit 1;
fi

wget -q https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.gz
tar -zxf boost_1_64_0.tar.gz
cd boost_1_64_0

./bootstrap.sh --with-toolset=${TOOLSET}
./b2 install -j8 \
  --with-filesystem \
  --with-system \
  --with-date_time \
  --with-program_options
cd ..

rm -r boost_1_64_0
rm boost_1_64_0.tar.gz

rm -r \
  /usr/local/include/boost/fusion* \
  /usr/local/include/boost/geometry* \
  /usr/local/include/boost/graph* \
  /usr/local/include/boost/hana* \
  /usr/local/include/boost/metaparse* \
  /usr/local/include/boost/multiprecision* \
  /usr/local/include/boost/phoenix* \
  /usr/local/include/boost/polygon* \
  /usr/local/include/boost/python* \
  /usr/local/include/boost/signals* \
  /usr/local/include/boost/spirit* \
  /usr/local/include/boost/test* \
  /usr/local/include/boost/vmd* \
  /usr/local/include/boost/xpressive*