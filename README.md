# docker-redis
Alpine based Dockerfile for a [redis](https://redis.io) image.

Differs from official docker image which by default forces write every second,
this version lets os decide.  It uses alpine version of redis with musl
memory managment, the official docker version is compiled wih jemalloc.
It also uses aof and rdb for better error recovery.
If the "STUNNEL" environment variable is set then an stunnel server is started
listeneing on port 6479 for ssl/tls connections, protected-mode is enabled
so redis will only listen to the loopback interface.  An stunnel client is then
needed to connect, and the file /etc/stunnel/psk.txt must exist with the pre shared
key in the format [here](https://www.stunnel.org/auth.html)

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/redis.svg?style=plastic)](https://hub.docker.com/r/a16bitsysop/redis/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/redis.svg?style=plastic)](https://hub.docker.com/r/a16bitsysop/redis/)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/a16bitsysop/redis/latest?style=plastic)](https://hub.docker.com/r/a16bitsysop/redis/)
[![Github SHA](https://img.shields.io/badge/dynamic/json?style=plastic&color=orange&label=Github%20SHA&query=object.sha&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fa16bitsysop%2Fdocker-redis%2Fgit%2Frefs%2Fheads%2Fmaster)](https://github.com/a16bitsysop/docker-redis)

## Github
Github Repository: [https://github.com/a16bitsysop/docker-redis](
https://github.com/a16bitsysop/docker-redis)

## Environment Variables
| Name     | Desription                                               | Default |
|----------|----------------------------------------------------------|---------|
| TIMEZONE | Timezone to use inside the container, eg Europe/London   | unset   |
| SIZE     | Increase in size that causes a rewrite to disc           | 16mb    |
| PERCENT  | Percentage increase that causes a rewrite to disc        | 50      |
| STUNNEL  | Use stunnel to encrypt redis traffic on port 6479 if set | unset   |

## Examples
**To run a container with docker managed volume mount on /data on network
MYNET (without exposing ports)**
```bash
#docker container run --net MYNET --mount source=redis-data,destination=/data \
-d --name redis a16bitsysop/redis
```
