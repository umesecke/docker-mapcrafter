FROM ubuntu:xenial
MAINTAINER Uwe Mesecke <uwe@mesecke.net>

ENV DEBIAN_FRONTEND=noninteractive
ENV MAPCRAFTER_VERSION=2.3.1-1

# base stuff
RUN apt-get update \
	&& apt-get -y install \
		wget \
		apt-transport-https \
	&& rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/keyring.gpg https://packages.mapcrafter.org/ubuntu/keyring.gpg \
	&& gpg --no-options --keyring /tmp/keyring.gpg --no-default-keyring --export 2>/dev/null | apt-key add - \
	&& rm -r /tmp/keyring.gpg \
	&& echo "deb https://packages.mapcrafter.org/ubuntu xenial main" > /etc/apt/sources.list.d/mapcrafter.list \
	&& apt-get update \
	&& apt-get -y install \
		cron \
		python \
		imagemagick \
		mapcrafter=$MAPCRAFTER_VERSION \
	&& rm -rf /var/lib/apt/lists/*

