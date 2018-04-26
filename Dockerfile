FROM ubuntu:latest
MAINTAINER Toru Hisai <toru@torus.jp>

RUN apt-get update -y
RUN apt-get install -y wget gcc
RUN apt-get install -y zlib1g-dev slib
RUN apt-get install -y make autoconf

WORKDIR /tmp
RUN wget http://prdownloads.sourceforge.net/gauche/Gauche-0.9.5.tgz
RUN tar xvfz Gauche-0.9.5.tgz

WORKDIR Gauche-0.9.5
RUN ./configure
RUN make
RUN make check # fails on Mac
RUN make install

WORKDIR /code
CMD gosh
