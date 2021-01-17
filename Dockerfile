FROM alpine:3.13
LABEL maintainer="Duncan Bellamy <dunk@denkimushi.com>"

# hadolint ignore=DL3018
RUN apk add -u --no-cache redis

COPY redis.conf /etc/redis.conf

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./
WORKDIR /data

ENTRYPOINT [ "entrypoint.sh" ]

HEALTHCHECK --start-period=60s CMD redis-cli PING || exit 1
