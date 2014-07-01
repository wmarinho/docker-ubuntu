# Ubuntu image
#
# Version 0.1

# Pull from Ubuntu


FROM ubuntu:14.04

MAINTAINER Wellington Marinho wpmarinho@globo.com

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No


# upgrade distro
RUN locale-gen en_US en_US.UTF-8
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install lsb-release -y

# clean packages
RUN apt-get clean \
	&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
