FROM ubuntu:16.04
MAINTAINER florian.loch@gmail.com

ADD . .

RUN ./installJDK.sh && rm installJDK.sh
RUN java -version

RUN apt-get update && apt-get install -y build-essential git cmake python maven

RUN ./buildFileCheck.sh && rm buildFileCheck.sh

