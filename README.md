# docker-redis
Alpine based Dockerfile for a [redis](https://redis.io) image.

Differs from official docker image which by default forces write every second, this version lets os decide.  It uses alpine version of redis with musl memory managment, the official docker version is compiled wih jemalloc.  It also uses aof and rdb for better error recovery.

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/redis.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/redis/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/redis.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/redis/)
[![](https://images.microbadger.com/badges/version/a16bitsysop/redis.svg)](https://microbadger.com/images/a16bitsysop/redis "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/a16bitsysop/redis.svg)](https://microbadger.com/images/a16bitsysop/redis "Get your own commit badge on microbadger.com")

## Github
Github Repository: [https://github.com/a16bitsysop/docker-redis](https://github.com/a16bitsysop/docker-redis)

## Environment Variables
| Name     | Desription                                             | Default |
|----------|--------------------------------------------------------|---------|
| TIMEZONE | Timezone to use inside the container, eg Europe/London | unset   |

## Examples
**To run a container with docker managed volume mount on /data on network MYNET (without exposing ports)**
```
#docker container run --net MYNET --mount source=redis-data,destination=/data -d --name redis a16bitsysop/redis
```
