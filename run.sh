#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker image ls
docker container run -d --name mysql -e MYSQL_ROOT_PASSWORD=root mysql
docker volume ls
docker container stop mysql
docker container rm mysql
docker volume ls
docker container run -d --name mysql -e MYSQL_ROOT_PASSWORD=root -v mysql-db:/var/lib/mysql mysql
docker container inspect mysql
docker volume create