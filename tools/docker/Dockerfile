FROM ubuntu:16.04

RUN apt-get update && \
    # Get required utils for later installs
    apt-get install -y apt-transport-https ca-certificates gnupg software-properties-common wget libreadline6-dev texinfo && \
    # Install GCC 7.2
    add-apt-repository ppa:jonathonf/gcc-7.2 && \
    apt-get update && \
    apt-get install -y gcc-7 g++-7 && \
    # Make sure the gcc and g++ command refer to GCC 7.2
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 999 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 999 && \
    update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-7 999 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-7 999 && \
    # Install a recent version of CMake (version 3.15 at the time of writing) that support C++17
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main' && \
    apt-get update && \
    apt-get install -y cmake && \
    # Clean up
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    # Build GDB 8.3 from source to enable remote gdbserver from Docker
    wget "http://ftp.gnu.org/gnu/gdb/gdb-8.3.tar.gz" && \
    tar xzf gdb-8.3.tar.gz && \
    cd gdb-8.3 && \
    ./configure --prefix=/usr --with-system-readline && \
    make && make install && \
    # Create the develop user for security reasons
    useradd -ms /bin/bash develop && \
    echo "develop   ALL=(ALL:ALL) ALL" >> /etc/sudoers

# gdbserver port
EXPOSE 2000

USER develop
WORKDIR /home/develop/dev
VOLUME /home/develop/dev
