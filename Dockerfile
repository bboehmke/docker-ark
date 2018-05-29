FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y lib32gcc1 wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /steam && \
    useradd -d /steam -s /bin/bash --uid 1000 steam && \
    chown -R steam /steam

ENV MAP=TheIsland

# add control script
ADD ark.sh /usr/local/bin/ark

# change user annd working dir
USER steam
VOLUME /steam
WORKDIR /steam

# server ports
EXPOSE 27015/udp 7777/udp 7778/udp

# start server
CMD ["ark"]