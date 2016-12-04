#! /usr/bin/env bash
set -e

# Copy dependencies
mkdir -p  /mj/mjc/deps/jfirm/classes/
cp -f mj/deps/jFirm/classes/jfirm.jar /mj/mjc/deps/jfirm/classes/jfirm.jar
mkdir -p /mj/mjc/deps/jfirm/lib/
cp -f /mj/deps/jFirm/lib/jna.jar /mj/mjc/deps/jfirm/lib/jna.jar
cp -f /mj/deps/libfirm/build/debug/libfirm.so /mj/mjc/libfirm.so

# Build our own porject mounted into the container
cd /mj/mjc
mvn -e clean
./build

# Get most recent version of mjtest
cd ..
git clone https://github.com/mini-java/mjtest.git
cd mjtest

# And run it
MJ_RUN="/mj/mjc/run" ./mjt.py all
