FROM ubuntu:trusty
MAINTAINER Tatsuro Hisamori <medianetworks@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# update, curl
RUN apt-get update
RUN apt-get -y install git cmake libssl-dev libyaml-dev libuv-dev build-essential

# install h2o
RUN git clone https://github.com/h2o/h2o \
    && cd h2o \
    && git submodule update --init --recursive \
    && cmake . \
    && make h2o

WORKDIR /h2o
ENTRYPOINT [ "./h2o", "-c" ]
