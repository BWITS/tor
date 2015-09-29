FROM alpine:3.2

MAINTAINER Bill W < ozbillwang@gmail.com>

RUN apk --update add tor --update-cache  \
        --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted && \
    rm -rf /var/cache/apk

EXPOSE 9150

RUN echo "Log notice stdout" >> /etc/torrc
RUN echo "SocksPort 0.0.0.0:9150" >> /etc/torrc

CMD /usr/bin/tor -f /etc/torrc
