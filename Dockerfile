FROM ubuntu:16.04
MAINTAINER florian.loch@gmail.com

ADD . .

# This does all the dirty work and creates just one image layer
RUN ./provision.sh

