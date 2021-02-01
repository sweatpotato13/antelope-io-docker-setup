# docker run -it -d -v /Users/mac/Documents/repo/eosio.contracts-1.8.x:/eosio.contracts-1.8.x --name eosio-cdt eostudio/eosio.cdt:v1.6.3

FROM ubuntu:18.04

LABEL maintainer="CuteWisp <sweatpotato13@gmail.com>"

USER root

WORKDIR /root

# Install basic packages
RUN apt-get update        \
    && apt-get install -y wget \
    && apt-get install -y git \
    && apt-get install -y cmake \
    && apt-get install -y g++
    

# Install eosio.cdt 1.6.3
RUN wget https://github.com/eosio/eosio.cdt/releases/download/v1.6.3/eosio.cdt_1.6.3-1-ubuntu-18.04_amd64.deb \
    && apt-get install -y --no-install-recommends ./eosio.cdt_1.6.3-1-ubuntu-18.04_amd64.deb \
    && rm -rf eosio.cdt_1.6.3-1-ubuntu-18.04_amd64.deb
