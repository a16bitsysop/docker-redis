FROM alpine:3.12
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

RUN apk add redis

COPY redis.conf /etc/redis.conf
CMD [ "redis-server", "/etc/redis.conf" ]
