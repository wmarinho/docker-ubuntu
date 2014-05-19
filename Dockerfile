# Ubuntu image
#
# Version 0.1

# Pull from Ubuntu


FROM ubuntu:latest

MAINTAINER Wellington Marinho wpmarinho@globo.com

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# install ssh
RUN apt-get install -y openssh-server


# apt config
ADD 25norecommends /etc/apt/apt.conf.d/25norecommends

# install openjdk7
RUN apt-get install openjdk-7-jdk -y
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /etc/environment

# upgrade distro
RUN locale-gen en_US en_US.UTF-8
RUN apt-get update && apt-get upgrade -y
RUN apt-get install lsb-release -y

# clean packages
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
