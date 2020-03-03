#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker network ls
docker network inspect my_mage2_app
docker container run -d --name my_nginx --network my_mage2_app nginx:alpine
#8bfd7981d9f438dd0ec001756c4c3ed72d9e39c4b851858a0ab3ceec46838272
docker network inspect my_mage2_app
# "Containers": {
#            "8bfd7981d9f438dd0ec001756c4c3ed72d9e39c4b851858a0ab3ceec46838272": {
#                "Name": "my_nginx",
#                "EndpointID": "79e6d4410dc4227b6c5bc4be12ddcc4fde7f539e44efd8606087817895b964cf",
#                "MacAddress": "02:42:ac:12:00:03",
#                "IPv4Address": "172.18.0.3/16",
#                "IPv6Address": ""
#            },
#            "e09f032f2ebcf97469998b4459a24278e8c540d42ac7fc29d1f47e017bf4e8f6": {
#                "Name": "new_nginx",
#                "EndpointID": "7dea7281cdc81a71b13c65b4510a5b3e4306859f23c6e2e6ddebe24a6dee7342",
#                "MacAddress": "02:42:ac:12:00:02",
#                "IPv4Address": "172.18.0.2/16",
#                "IPv6Address": ""
#            }
#        },
docker container exec -it my_nginx ping new_nginx
#PING new_nginx (172.18.0.2): 56 data bytes
#64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.079 ms
#64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.135 ms
#64 bytes from 172.18.0.2: seq=2 ttl=64 time=0.128 ms
docker container exec -it new_nginx ping my_nginx
