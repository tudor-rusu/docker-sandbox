#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker image ls
docker image build -t customnginx ./build/image_testing/
#....
#Step 6/7 : EXPOSE 80 443
# ---> Running in ef1e1b57e1d0
#Removing intermediate container ef1e1b57e1d0
# ---> 435c797aef71
#Step 7/7 : CMD ["nginx", "-g", "daemon off;"]
# ---> Running in 9519038f4dd2
#Removing intermediate container 9519038f4dd2
# ---> cc87b51667f9
#Successfully built cc87b51667f9
#Successfully tagged customnginx:latest
docker image ls
#REPOSITORY                                                                TAG                 IMAGE ID            CREATED             SIZE
#customnginx                                                               latest              cc87b51667f9        2 minutes ago       108MB
#nginx                                                                     latest              6678c7c2e56c        21 hours ago        127MB
#tudorrusu/nginx                                                           latest              6678c7c2e56c        21 hours ago        127MB
#tudorrusu/nginx                                                           testing             6678c7c2e56c        21 hours ago        127MB

