#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

#docker container run --publish 80:80 nginx
docker container run --publish 80:80 --detach nginx
docker container ls
docker container stop 5d0a0
docker container ls
docker container ls -a
docker container run -p 80:80 -d --name webhost nginx
docker container ls -a
docker container logs webhost
docker container top webhost
docker container ls -a
docker container rm -f 0312 5d0a 2ca0