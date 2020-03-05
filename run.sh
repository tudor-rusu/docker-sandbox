#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker image ls
docker image tag nginx tudorrusu/nginx
docker image push tudorrusu/nginx
#The push refers to repository [docker.io/tudorrusu/nginx]
#55a77731ed26: Preparing
#71f2244bc14d: Preparing
#f2cb0ecef392: Preparing
#denied: requested access to the resource is denied
docker login
#Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
#Username: tudorrusu
#Password:
#WARNING! Your password will be stored unencrypted in /home/tudor/.docker/config.json.
#Configure a credential helper to remove this warning. See
#https://docs.docker.com/engine/reference/commandline/login/#credentials-store
#
#Login Succeeded
cat ~/.docker/config.json
docker image push tudorrusu/nginx
#The push refers to repository [docker.io/tudorrusu/nginx]
#55a77731ed26: Mounted from library/nginx
#71f2244bc14d: Mounted from library/nginx
#f2cb0ecef392: Mounted from library/nginx
#latest: digest: sha256:3936fb3946790d711a68c58be93628e43cbca72439079e16d154b5db216b58da size: 948
docker image tag tudorrusu/nginx tudorrusu/nginx:testing
docker image push tudorrusu/nginx:testing