FROM armhf/alpine:3.5

RUN addgroup -S mosquitto && \
    adduser -S -H -h /var/empty -s /sbin/nologin -D -G mosquitto mosquitto

ENV MOSQUITTO_VERSION 1.4.11
RUN buildDeps='build-base openssl-dev libwebsockets-dev c-ares-dev util-linux-dev'; \
    apk update && \
    apk add $buildDeps openssl libwebsockets c-ares libuuid && \ 
    mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    wget http://mosquitto.org/files/source/mosquitto-${MOSQUITTO_VERSION}.tar.gz && \
    tar xvzf mosquitto-${MOSQUITTO_VERSION}.tar.gz && \
    cd mosquitto-${MOSQUITTO_VERSION} && \
    # musl doesn't have libanl
    sed -i 's/ -lanl//' config.mk && \
    # Busybox install doesn't accept --strip-program
    sed -i 's|--strip-program=${CROSS_COMPILE}${STRIP}||' */Makefile */*/Makefile && \
    make WITH_WEBSOCKETS=yes && make install && \
    cd .. && \
    rm mosquitto-${MOSQUITTO_VERSION}.tar.gz && \
    rm -rf mosquitto-${MOSQUITTO_VERSION} && \
    apk del $buildDeps && rm -rf /var/cache/apk/*

EXPOSE 1883

CMD ["mosquitto"]
