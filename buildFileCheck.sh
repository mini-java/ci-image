git clone --depth=1 http://llvm.org/git/llvm.git
cd llvm
mkdir MY_BUILD/
cd MY_BUILD && cmake ../
make FileCheck
cp bin/FileCheck /usr/local/bin/FileCheck
cd ../..
rm -rf llvm