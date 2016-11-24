# Add source for java8
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

apt-get install -y --no-install-recommends make ant build-essential git cmake python maven oracle-java8-installer


# Build and install lit
git clone --depth=1 http://llvm.org/git/llvm.git
cp -R llvm/utils/lit /usr/local/bin/llvm-lit
cp lit /usr/local/bin/lit # containted in this repo, forwards to lit utility

# Build and install FileCheck
cd llvm
mkdir MY_BUILD/
cd MY_BUILD && cmake ../
make FileCheck
cp bin/FileCheck /usr/local/bin/FileCheck
cd ../..
rm -rf llvm

# cleanup
apt-get purge -y cmake
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
rm -rf ~/.local/share/Trash/*

# Test (this leads to non-zero exit code and will ruin your current build)
# echo "JAVA:"
# java -version
# echo "FILECHECK:"
# FileCheck
# echo "LIT":
# lit
