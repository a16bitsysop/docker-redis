FROM alpine:3.12
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

RUN apk add --no-cache redis

COPY redis.conf /etc/redis.conf
WORKDIR /data
CMD [ "redis-server", "/etc/redis.conf" ]
