#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker container run -p 80:80 -d --name nginx nginx
docker container run -d -p 3306:3306 --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql
docker container logs db
# 2020-03-02 13:37:45+00:00 [Note] [Entrypoint]: GENERATED ROOT PASSWORD: sha6quuFooGhouNaequahpheo2JoPhei
docker container top db
docker container inspect nginx
docker container stats
docker container ls -a
docker container rm -f 098d 78c5 519e
docker container ls -a