FROM ubuntu:latest
MAINTAINER Igor Shishkin <me@teran.ru>

EXPOSE 5901

ENV USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      lxde-core \
      lxterminal \
      tightvncserver \
      xrdp && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

RUN (echo password ; echo password) | vncpasswd

COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
