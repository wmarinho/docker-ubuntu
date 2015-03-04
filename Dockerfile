# Ubuntu image
#
# Version 0.1

# Pull from Ubuntu


FROM ubuntu:14.04

MAINTAINER Wellington Marinho wpmarinho@globo.com

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# apt config
ADD 25norecommends /etc/apt/apt.conf.d/25norecommends

# upgrade distro
RUN locale-gen en_US en_US.UTF-8
RUN apt-get update && apt-get upgrade -y \
        && apt-get install lsb-release -y

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java -y

RUN apt-get update -y

# automatically accept oracle license
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections


# and install java 7 oracle jdk
RUN apt-get -y install oracle-java7-installer \
	&& update-alternatives --display java \
	&& echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment

# clean packages
RUN apt-get clean \
	&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
