FROM debian:jessie

RUN apt-get update &&\
    apt-get install -y sudo libssl-dev git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    usermod -a -G sudo openwrt &&\
    sudo -iu openwrt git clone git://git.openwrt.org/15.05/openwrt.git &&\
    sudo -iu openwrt openwrt/scripts/feeds update

RUN cd /home/openwrt/openwrt &&\
    make defconfig
