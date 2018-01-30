FROM ubuntu:latest

ARG GEARMAN_VERSION=1.1.18
ENV GEARMAN_VERSION $GEARMAN_VERSION

RUN apt-get update --fix-missing && \
    apt-get -y upgrade && \
    apt-get install -y \
        automake \
        build-essential \
        gperf \
        libboost-all-dev \
        libevent-dev \
        libhiredis-dev \
        libtool \
        python-sphinx \
        uuid-dev \
        git && \
    git clone --depth 1 -b $GEARMAN_VERSION https://github.com/gearman/gearmand.git /tmp/gearmand && \
    cd /tmp/gearmand && \
    ./bootstrap.sh -a && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    rm -rf /tmp/* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 4730

ENV OPTIONS ""

CMD ["/usr/local/sbin/gearmand", "${OPTIONS}"]
