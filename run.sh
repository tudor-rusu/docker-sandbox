#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker image ls
docker container run -p 80:80 --rm nginx
docker image build -t nginx-with-html ./build/image_extend/
#Sending build context to Docker daemon  3.072kB
#Step 1/3 : FROM nginx:latest
# ---> 6678c7c2e56c
#Step 2/3 : WORKDIR /usr/share/nginx/html
# ---> Running in da3507f30bf2
#Removing intermediate container da3507f30bf2
# ---> 9d55c95c0172
#Step 3/3 : COPY index.html index.html
# ---> 0d714875687a
#Successfully built 0d714875687a
#Successfully tagged nginx-with-html:latest
docker image ls
#REPOSITORY                                                                TAG                 IMAGE ID            CREATED             SIZE
#nginx-with-html                                                           latest              0d714875687a        26 seconds ago      127MB
#customnginx                                                               latest              cc87b51667f9        46 minutes ago      108MB
docker container run -p 80:80 --rm nginx-with-html
#on browser http://localhost -----> You just successfully ran a container with a custom file copied into the image at build time!
