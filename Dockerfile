FROM ubuntu:16.04
MAINTAINER florian.loch@gmail.com

ADD provision.sh provision.sh
ADD run_tests.sh run_tests.sh

# This does all the dirty work and creates just one image layer
RUN ./provision.sh

