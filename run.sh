#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker container run -p 80:80 -d --name nginx nginx
# return: 3f6b9e95b9ed231c50fdbcab1bbbb6c75745b75f55d2694af68ddafdf910696e
docker container run -p 8080:80 -d --name httpd httpd
# return:
# Unable to find image 'httpd:latest' locally
# latest: Pulling from library/httpd
# 68ced04f60ab: Already exists
# 35d35f1e0dc9: Pull complete
# 8a918bf0ae55: Pull complete
# d7b9f2dbc195: Pull complete
# d56c468bde81: Pull complete
# Digest: sha256:946c54069130dbf136903fe658fe7d113bd8db8004de31282e20b262a3e106fb
# Status: Downloaded newer image for httpd:latest
# 56060931002c9f663bc74fad05131d9a37da9fdba1100ac995e4b16456789b5f
docker container run -p 3306:3306 -d --name mysql mysql
# return:
#Unable to find image 'mysql:latest' locally
#latest: Pulling from library/mysql
#6d28e14ab8c8: Pull complete
#dda15103a86a: Pull complete
#55971d75ab8c: Pull complete
#f1d4ea32020b: Pull complete
#61420072af91: Pull complete
#05c10e6ccca5: Pull complete
#7e0306b13322: Pull complete
#900b113c001e: Pull complete
#06cd07c30bf4: Pull complete
#df0d65aee5aa: Pull complete
#53eeb6e0335c: Pull complete
#6cf8f9563e97: Pull complete
#igest: sha256:f91e704ffa9f19b9a267d9321550a0772a1b64902226d739d3527fd6edbe3dfe
#Status: Downloaded newer image for mysql:latest
#acdef1842770eb02626afa7941af41072fad9c18fedd3ae7f74eb85a6edb6d87
docker container ls
docker container rm -f acde 5606 3f6b
docker container ls -a
