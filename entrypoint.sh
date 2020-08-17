#!/bin/sh
NME=redis
set-timezone.sh "$NME"

redis-server /etc/redis.conf
