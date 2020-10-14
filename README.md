# docker-redis
Alpine based Dockerfile for a [redis](https://redis.io) image.

Differs from official docker image which by default forces write every second,
this version lets os decide.  It uses alpine version of redis with musl
memory managment, the official docker version is compiled wih jemalloc.
It also uses aof and rdb for better error recovery.

[![Docker Pulls](
https://img.shields.io/docker/pulls/a16bitsysop/redis.svg?style=flat-square)](
https://hub.docker.com/r/a16bitsysop/redis/)
[![Docker Stars](
https://img.shields.io/docker/stars/a16bitsysop/redis.svg?style=flat-square)](
https://hub.docker.com/r/a16bitsysop/redis/)
[![Version](
https://images.microbadger.com/badges/version/a16bitsysop/redis.svg)](
https://microbadger.com/images/a16bitsysop/redis "Get_your_own_version_badge_on_microbadger.com")
[![Commit](
https://images.microbadger.com/badges/commit/a16bitsysop/redis.svg)](
https://microbadger.com/images/a16bitsysop/redis "Get_your_own_commit_badge_on_microbadger.com")

## Github
Github Repository: [https://github.com/a16bitsysop/docker-redis](
https://github.com/a16bitsysop/docker-redis)

## Environment Variables
| Name     | Desription                                              | Default |
|----------|---------------------------------------------------------|---------|
| TIMEZONE | Timezone to use inside the container, eg Europe/London  | unset   |
| SIZE     | Increase in size that causes a rewrite to disc          | 16mb    |
| PERCENT  | Percentage increase that causes a rewrite to disc       | 50      |

## Examples
**To run a container with docker managed volume mount on /data on network
MYNET (without exposing ports)**
```bash
#docker container run --net MYNET --mount source=redis-data,destination=/data \
-d --name redis a16bitsysop/redis
```
