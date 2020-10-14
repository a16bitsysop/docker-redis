FROM alpine:3.12
LABEL maintainer="Duncan Bellamy <dunk@denkimushi.com>"

# hadolint ignore=DL3018
RUN apk add --no-cache redis

COPY redis.conf /etc/redis.conf

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./
WORKDIR /data

ENTRYPOINT [ "entrypoint.sh" ]

HEALTHCHECK CMD redis-cli PING || exit 1
