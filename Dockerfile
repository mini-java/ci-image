FROM ubuntu:16.04
MAINTAINER florian.loch@gmail.com

ADD . .

RUN apt-get update \
    && apt-get install -y build-essential git cmake python maven \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/llvm-mirror/llvm.git \
    && mv llvm/utils/lit /usr/local/bin/llvm-lit \
    && rm -rf llvm

RUN cp lit /usr/local/bin/lit

RUN ./installJDK.sh \
    && rm installJDK.sh \
    && java -version

RUN ./buildFileCheck.sh \
    && rm buildFileCheck.sh

