#! /usr/bin/env bash
set -e

# Add source for java8
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

apt-get update

apt-get install -y --no-install-recommends make ant build-essential cmake python python3 maven oracle-java8-installer
apt-get install -y git # adding --no-install-recommends causes ca certs to be not installed, resulting in tls error when accessing github

mkdir -p /mj/deps/
cd /mj/deps/
git clone https://github.com/MatzeB/libfirm.git
git clone https://github.com/MatzeB/jFirm.git

make -C ./libfirm/ clean
ant -buildfile ./jFirm/build.xml

# cleanup
apt-get purge -y cmake
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
rm -rf ~/.local/share/Trash/*
