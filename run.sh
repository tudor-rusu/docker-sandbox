#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker image ls
docker image history nginx
docker pull nginx
docker image inspect nginx