#!/bin/sh
#display environment variables passed with --env
echo '$PERCENT=' $PERCENT
echo '$SIZE=' $SIZE
NME=redis
set-timezone.sh "$NME"

[ -z "$PERCENT" ] && PERCENT=50
[ -z "$SIZE" ] && SIZE="16mb"

sed -r "s+(.*rewrite-percentage).*+\1 $PERCENT+" -i /etc/redis.conf
sed -r "s+(.*rewrite-min-size).*+\1 $SIZE+" -i /etc/redis.conf

redis-server /etc/redis.conf
