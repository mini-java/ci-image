#! /usr/bin/env bash
set -e

# Copy dependencies
cp /libfirm.so /mjc/libfirm.so

# Build our own project mounted into the container
cd /mjc
# mvn -e clean
./build

# Get most recent version of mjtest
cd ..
git clone https://github.com/mini-java/mjtest.git
cd mjtest

# And run it
MJ_RUN="/mjc/run" ./mjt.py all
