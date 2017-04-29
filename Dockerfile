FROM teran/ubuntu-xserver:latest
MAINTAINER Igor Shishkin <me@teran.ru>

USER root
RUN apt-get update && \
    apt-get install -y \
      firefox \
      icedtea-7-plugin && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

USER user
