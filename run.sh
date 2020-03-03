#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker container run -p 80:80 -d --name webhost nginx
#015e134940414389fe18252e5b42a73596f84db555f252e0f1ca5970ff379a5a
docker container port webhost
#80/tcp -> 0.0.0.0:80
docker container inspect --format "{{.NetworkSettings.IPAddress}}" webhost
#172.17.0.2
