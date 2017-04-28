FROM ubuntu:trusty
MAINTAINER Igor Shishkin <me@teran.ru>

EXPOSE 5901

ENV USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      lxde-core && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y \
      lxterminal \
      tightvncserver \
      xrdp && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y \
      firefox \
      icedtea-7-plugin && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

RUN (echo password ; echo password) | vncpasswd

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
