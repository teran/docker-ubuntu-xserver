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

RUN useradd -d /home/user -m -s /bin/bash user

COPY entrypoint.sh /entrypoint.sh

USER user
WORKDIR /home/user
ENV HOME=/home/user

RUN (echo password ; echo password) | vncpasswd

CMD ["/entrypoint.sh"]
