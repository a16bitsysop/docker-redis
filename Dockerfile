FROM alpine:3.12
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

RUN apk add --no-cache redis

COPY redis.conf /etc/redis.conf

WORKDIR /usr/local/bin
COPY entrypoint.sh .
WORKDIR /data

ENTRYPOINT [ "entrypoint.sh" ]
