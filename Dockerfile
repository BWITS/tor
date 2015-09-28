FROM alpine:3.2

MAINTAINER Bill W < ozbillwang@gmail.com>

ENV REFRESHED_AT 20150928
ENV TORNAME tor-0.2.6.10

RUN apk --update add alpine-sdk libevent-dev python openssl-dev && \
    curl -L https://www.torproject.org/dist/${TORNAME}.tar.gz | tar zx -C /tmp && \
    cd /tmp/${TORNAME} && \
    ./configure --with-openssl-dir=/usr/bin CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2" && \
    make && \
    make install && \
    apk del alpine-sdk python && \
    rm -rf /var/cache/apk/* /tmp/${TORNAME}

EXPOSE 9150

RUN echo "Log notice stdout" >> /etc/torrc
RUN echo "SocksPort 0.0.0.0:9150" >> /etc/torrc

CMD /usr/local/bin/tor -f /etc/torrc
