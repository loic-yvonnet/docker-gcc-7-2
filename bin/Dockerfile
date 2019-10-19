FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:jonathonf/gcc-7.2 && \
    apt-get update && \
    apt-get install -y gcc-7 g++-7 cmake gdb gdbserver && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 999 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 999 && \
    update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-7 999 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-7 999 && \
    useradd -ms /bin/bash develop && \
    echo "develop   ALL=(ALL:ALL) ALL" >> /etc/sudoers

# gdbserver port
EXPOSE 2000

USER develop
WORKDIR /home/develop/dev
VOLUME /home/develop/dev