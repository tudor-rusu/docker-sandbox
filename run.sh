#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker container run -it --name proxy nginx bash
docker container run -it --name ubuntu ubuntu bash
#root@0e4f37dfedaa:/# apt-get update
#root@0e4f37dfedaa:/# apt-get install -y curl
#root@0e4f37dfedaa:/# curl google.com
#root@0e4f37dfedaa:/# exit
docker container start -ai ubuntu
#root@0e4f37dfedaa:/# curl siteards.com
#root@0e4f37dfedaa:/# exit
docker container start ubuntu
docker container exec -it ubuntu ps aux
docker container ls -a
docker container rm -f 0e4f3 eb6533