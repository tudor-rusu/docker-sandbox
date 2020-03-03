#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker network ls
docker network inspect bridge
#"Containers": {
#            "015e134940414389fe18252e5b42a73596f84db555f252e0f1ca5970ff379a5a": {
#                "Name": "webhost",
#                "EndpointID": "94be114a01a4c5022299a8bfabff4619bab391e26185f4116d0a01b3d4bfcb9c",
#                "MacAddress": "02:42:ac:11:00:02",
#                "IPv4Address": "172.17.0.2/16",
#                "IPv6Address": ""
#            }
#        },
#"IPAM": {
#            "Driver": "default",
#            "Options": null,
#            "Config": [
#                {
#                    "Subnet": "172.17.0.0/16",
#                    "Gateway": "172.17.0.1"
#                }
#            ]
#        },
docker network create my_mage2_app
#5ccde48590b64a7ab07eb7188f11dfb194eea9a7893c4b01a2f27d569dadb3aa
docker network ls
docker container run -d --name new_nginx --network my_mage2_app nginx:alpine
#Unable to find image 'nginx:alpine' locally
#alpine: Pulling from library/nginx
#4167d3e14976: Pull complete
#db94a93dfca0: Pull complete
#Digest: sha256:9e81b8f9cef5a095f892183688798a5b2c368663276aa0f2be4b1cd283ace53d
#Status: Downloaded newer image for nginx:alpine
#e09f032f2ebcf97469998b4459a24278e8c540d42ac7fc29d1f47e017bf4e8f6
docker network inspect my_mage2_app
#"Containers": {
#            "e09f032f2ebcf97469998b4459a24278e8c540d42ac7fc29d1f47e017bf4e8f6": {
#                "Name": "new_nginx",
#                "EndpointID": "7dea7281cdc81a71b13c65b4510a5b3e4306859f23c6e2e6ddebe24a6dee7342",
#                "MacAddress": "02:42:ac:12:00:02",
#                "IPv4Address": "172.18.0.2/16",
#                "IPv6Address": ""
#            }
#        },
docker network connect my_mage2_app webhost
docker container inspect webhost
#"Networks": {
#                "bridge": {
#                    "IPAMConfig": null,
#                    "Links": null,
#                    "Aliases": null,
#                    "NetworkID": "f8bfecc3ae41ef36a26da424ad4a0fa90b254df32552651792103f035e4e2dde",
#                    "EndpointID": "94be114a01a4c5022299a8bfabff4619bab391e26185f4116d0a01b3d4bfcb9c",
#                    "Gateway": "172.17.0.1",
#                    "IPAddress": "172.17.0.2",
#                    "IPPrefixLen": 16,
#                    "IPv6Gateway": "",
#                    "GlobalIPv6Address": "",
#                    "GlobalIPv6PrefixLen": 0,
#                    "MacAddress": "02:42:ac:11:00:02",
#                    "DriverOpts": null
#                },
#                "my_mage2_app": {
#                    "IPAMConfig": {},
#                    "Links": null,
#                    "Aliases": [
#                        "015e13494041"
#                    ],
#                    "NetworkID": "5ccde48590b64a7ab07eb7188f11dfb194eea9a7893c4b01a2f27d569dadb3aa",
#                    "EndpointID": "7acfa87220cb87a8d7688c150944780cd6a04f07c3a590b4fb11e1409a678000",
#                    "Gateway": "172.18.0.1",
#                    "IPAddress": "172.18.0.3",
#                    "IPPrefixLen": 16,
#                    "IPv6Gateway": "",
#                    "GlobalIPv6Address": "",
#                    "GlobalIPv6PrefixLen": 0,
#                    "MacAddress": "02:42:ac:12:00:03",
#                    "DriverOpts": {}
docker network disconnect my_mage2_app webhost
docker container inspect webhost