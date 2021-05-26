#!/bin/sh
#display environment variables passed with --env
echo "\$PERCENT= $PERCENT"
echo "\$SIZE= $SIZE"
echo "\$STUNNEL= $STUNNEL"
NME=redis
set-timezone.sh "$NME"

[ -z "$PERCENT" ] && PERCENT=50
[ -z "$SIZE" ] && SIZE="16mb"

sed -r "s/(.*rewrite-percentage).*/\1 $PERCENT/" -i /etc/redis.conf
sed -r "s/(.*rewrite-min-size).*/\1 $SIZE/" -i /etc/redis.conf

if [ -n "$STUNNEL" ]
then
	openssl req -x509 -newkey rsa:4096 -keyout /etc/stunnel/key.pem -out /etc/stunnel/cert.pem -days 365 -nodes -subj '/CN=localhost'
	[ ! -f /etc/stunnel/psk.txt ] && echo "/etc/stunnel/psk.txt needed for stunnel" && exit 1
	chmod 600 /etc/stunnel/psk.txt
	stunnel /etc/stunnel/stunnel.conf
	sed -r "s/(protected-mode).*/\1 yes/" -i /etc/redis.conf
fi

#check aof file is okay and use dump.rdb if not
if [ -f /data/appendonly.aof ]
then
	redis-check-aof /data/appendonly.aof || mv /data/appendonly.aof /data/appendonly.aof.bad
	[ -f /data/dump.rdb ] && cp /data/dump.rdb /data/appendonly.aof
fi

redis-server /etc/redis.conf
