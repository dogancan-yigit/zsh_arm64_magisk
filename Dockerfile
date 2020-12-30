FROM ubuntu:20.04

RUN printf '%s\n' \
	'deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ focal main multiverse restricted universe' \
	'deb [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ focal main multiverse restricted universe' \
	'deb [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ focal-updates main multiverse restricted universe' \
	'deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ focal-updates main multiverse restricted universe' \
	'deb [arch=amd64] http://security.ubuntu.com/ubuntu/ focal-security main multiverse restricted universe' \
	> /etc/apt/sources.list && \
	dpkg --add-architecture armhf && apt update && apt full-upgrade -y && apt autoremove -y && \
	apt install -y git wget make zip tar xz-utils libncurses-dev:armhf gcc-10-arm-linux-gnueabihf

WORKDIR /zsh_magisk
ARG build_arch="armv7l-unknown-linux-gnueabihf"
ENV ARCH=$build_arch

ENTRYPOINT [ "/bin/bash", "-c", "make clean; make distclean; CC=arm-linux-gnueabihf-gcc-10 make" ]
