
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG SETUP_FILE

RUN apt-get update
RUN apt-get install -y \
	libtinfo5 \
	locales-all \
	locales \
	tofrodos \
	iproute2 \
	gawk \
	xvfb \
	git \
	make \
	net-tools \
	libncurses5-dev \
	update-inetd \
	tftpd \
	zlib1g-dev \
	libssl-dev \
	flex \
	bison \
	libselinux1 \
	gnupg \
	wget \
	diffstat \
	chrpath \
	socat \
	xterm \
	autoconf \
	libtool \
	libtool-bin \
	tar \
	unzip \
	texinfo \
	zlib1g-dev \
	gcc-multilib \
	build-essential \
	libsdl1.2-dev \
	libglib2.0-dev \
	screen \
	pax \
	gzip \
	python3-gi \
	less \
	lsb-release \
	fakeroot \
	libgtk2.0-0 \
	libgtk2.0-dev \
	cpio \
	rsync \
	xorg \
	expect \
	dos2unix \
	libudev-dev \
	xauth \
	libcanberra-gtk-module \
	libcanberra-gtk3-module


RUN locale-gen "en_US.UTF-8"

RUN useradd -ms /bin/bash mmr -G sudo
RUN echo "mmr:mmr" | chpasswd
COPY ./${SETUP_FILE} /home/mmr


USER mmr
WORKDIR /opt

CMD ["/bin/bash"]

