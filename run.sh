#!/bin/bash

# A script used to test Docker Mastery Course

set -eu

docker container ls -a
docker image ls
docker network ls
docker volume ls
docker-compose --version
#docker-compose version 1.24.0, build 0aa59064
cp ~/Cursuri/docker_mastery_udemy/udemy-docker-mastery/compose-sample-2/docker-compose.yml ./deploy/DockerCompose/
cp ~/Cursuri/docker_mastery_udemy/udemy-docker-mastery/compose-sample-2/nginx.conf ./deploy/DockerCompose/
cd deploy/DockerCompose
docker-compose up
#Creating network "dockercompose_default" with the default driver
#Pulling proxy (nginx:1.13)...
#1.13: Pulling from library/nginx
#f2aa67a397c4: Pull complete
#3c091c23e29d: Pull complete
#4a99993b8636: Pull complete
#Digest: sha256:b1d09e9718890e6ebbbd2bc319ef1611559e30ce1b6f56b2e3b479d9da51dc35
#Status: Downloaded newer image for nginx:1.13
#Pulling web (httpd:)...
#latest: Pulling from library/httpd
#68ced04f60ab: Pull complete
#35d35f1e0dc9: Pull complete
#8a918bf0ae55: Pull complete
#d7b9f2dbc195: Pull complete
#d56c468bde81: Pull complete
#Digest: sha256:946c54069130dbf136903fe658fe7d113bd8db8004de31282e20b262a3e106fb
#Status: Downloaded newer image for httpd:latest
#Creating dockercompose_proxy_1 ... done
#Creating dockercompose_web_1   ... done
#Attaching to dockercompose_proxy_1, dockercompose_web_1
#web_1    | AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.18.0.2. Set the 'ServerName' directive globally to suppress this message
#web_1    | AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.18.0.2. Set the 'ServerName' directive globally to suppress this message
#web_1    | [Mon Mar 09 08:38:15.536849 2020] [mpm_event:notice] [pid 1:tid 139778679501952] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
#web_1    | [Mon Mar 09 08:38:15.537140 2020] [core:notice] [pid 1:tid 139778679501952] AH00094: Command line: 'httpd -D FOREGROUND'

# after call url http://localhost in browser I get the trafic
#proxy_1  | 172.18.0.1 - - [09/Mar/2020:09:24:15 +0000] "GET /favicon.ico HTTP/1.1" 404 196 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" "-"
#web_1    | 172.18.0.3 - - [09/Mar/2020:09:24:15 +0000] "GET /favicon.ico HTTP/1.0" 404 196
#web_1    | 172.18.0.3 - - [09/Mar/2020:09:24:18 +0000] "GET / HTTP/1.0" 200 45
#proxy_1  | 172.18.0.1 - - [09/Mar/2020:09:24:18 +0000] "GET / HTTP/1.1" 200 45 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" "-"

#then close the session with Ctrl+C
docker-compose up -d
#Starting dockercompose_proxy_1 ... done
#Starting dockercompose_web_1   ... done
docker-compose logs
#web_1    | [Mon Mar 09 09:27:39.893375 2020] [core:notice] [pid 1:tid 140449782523008] AH00094: Command line: 'httpd -D FOREGROUND'
#web_1    | 172.18.0.2 - - [09/Mar/2020:09:28:31 +0000] "GET / HTTP/1.0" 304 -
#web_1    | 172.18.0.2 - - [09/Mar/2020:09:28:32 +0000] "GET / HTTP/1.0" 304 -
#proxy_1  | 172.18.0.1 - - [09/Mar/2020:09:24:15 +0000] "GET /favicon.ico HTTP/1.1" 404 196 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" "-"
#proxy_1  | 172.18.0.1 - - [09/Mar/2020:09:24:18 +0000] "GET / HTTP/1.1" 200 45 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" "-"
#proxy_1  | 172.18.0.1 - - [09/Mar/2020:09:28:31 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" "-"
#proxy_1  | 172.18.0.1 - - [09/Mar/2020:09:28:32 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" "-"
docker-compose top
#dockercompose_proxy_1
#  UID       PID    PPID    C   STIME   TTY     TIME                        CMD
#--------------------------------------------------------------------------------------------------
#root       18601   18547   0   10:27   ?     00:00:00   nginx: master process nginx -g daemon off;
#systemd+   18826   18601   0   10:27   ?     00:00:00   nginx: worker process
#
#dockercompose_web_1
# UID      PID    PPID    C   STIME   TTY     TIME            CMD
#------------------------------------------------------------------------
#root     18578   18537   0   10:27   ?     00:00:00   httpd -DFOREGROUND
#daemon   18728   18578   0   10:27   ?     00:00:00   httpd -DFOREGROUND
#daemon   18730   18578   0   10:27   ?     00:00:00   httpd -DFOREGROUND
#daemon   18731   18578   0   10:27   ?     00:00:00   httpd -DFOREGROUND
#daemon   18988   18578   0   10:28   ?     00:00:00   httpd -DFOREGROUND
docker-compose down
#Stopping dockercompose_web_1   ... done
#Stopping dockercompose_proxy_1 ... done
#Removing dockercompose_web_1   ... done
#Removing dockercompose_proxy_1 ... done
#Removing network dockercompose_default

#assignment 1
nano docker-compose-assign-1.yml
docker-compose -f docker-compose-assign-1.yml up
#Creating network "dockercompose_default" with the default driver
#Creating volume "dockercompose_drupal-modules" with default driver
#Creating volume "dockercompose_drupal-profiles" with default driver
#Creating volume "dockercompose_drupal-sites" with default driver
#Creating volume "dockercompose_drupal-themes" with default driver
#Pulling drupal (drupal:)...
#latest: Pulling from library/drupal
#6d28e14ab8c8: Pull complete
#9ecd958eae23: Pull complete
#4611cd46d612: Pull complete
#ad4a2514121d: Pull complete
#0b5e20585113: Pull complete
#41449f0f405d: Pull complete
#8ac46b57a971: Pull complete
#fbb79e9a209f: Pull complete
#2bbaf0b0b4e6: Pull complete
#f2eb2245bea2: Pull complete
#341ead679d30: Pull complete
#f57261f4f556: Pull complete
#36f9693fb790: Pull complete
#275c43c6b7cd: Pull complete
#a3cddf097b5e: Pull complete
#75d725b4b61d: Pull complete
#Digest: sha256:126f4fc7bcdc870ed04fc355fe832ed2315e63d1baddb86754fed8650f8252ba
#Status: Downloaded newer image for drupal:latest
#Pulling postgres (postgres:)...
#latest: Pulling from library/postgres
#68ced04f60ab: Already exists
#59f4081d08e6: Pull complete
#74fc17f00df0: Pull complete
#8e5e30d57895: Pull complete
#a1fd179b16c6: Pull complete
#7496d9eb4150: Pull complete
#0328931819fd: Pull complete
#8acde85a664a: Pull complete
#38e831e7d2d3: Pull complete
#582b4ba3b134: Pull complete
#cbf69ccc1db5: Pull complete
#1e1f3255b2e0: Pull complete
#c1c0cedd64ec: Pull complete
#6adde56874ed: Pull complete
#Digest: sha256:110d3325db02daa6e1541fdd37725fcbecb7d51411229d922562f208c51d35cc
#Status: Downloaded newer image for postgres:latest
#Creating dockercompose_drupal_1   ... done
#Creating dockercompose_postgres_1 ... done
#Attaching to dockercompose_drupal_1, dockercompose_postgres_1
#drupal_1    | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.19.0.3. Set the 'ServerName' directive globally to suppress this message
#drupal_1    | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.19.0.3. Set the 'ServerName' directive globally to suppress this message
#drupal_1    | [Mon Mar 09 09:51:58.595710 2020] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.25 (Debian) PHP/7.3.15 configured -- resuming normal operations
#drupal_1    | [Mon Mar 09 09:51:58.595746 2020] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
#postgres_1  | The files belonging to this database system will be owned by user "postgres".
#postgres_1  | This user must also own the server process.
#postgres_1  |
#postgres_1  | The database cluster will be initialized with locale "en_US.utf8".
#postgres_1  | The default database encoding has accordingly been set to "UTF8".
#postgres_1  | The default text search configuration will be set to "english".
#postgres_1  |
#postgres_1  | Data page checksums are disabled.
#postgres_1  |
#postgres_1  | fixing permissions on existing directory /var/lib/postgresql/data ... ok
#postgres_1  | creating subdirectories ... ok
#postgres_1  | selecting dynamic shared memory implementation ... posix
#postgres_1  | selecting default max_connections ... 100
#postgres_1  | selecting default shared_buffers ... 128MB
#postgres_1  | selecting default time zone ... Etc/UTC
#postgres_1  | creating configuration files ... ok
#postgres_1  | running bootstrap script ... ok
#postgres_1  | performing post-bootstrap initialization ... ok
#postgres_1  | syncing data to disk ... ok
#postgres_1  |
#postgres_1  |
#postgres_1  | Success. You can now start the database server using:
#postgres_1  |
#postgres_1  |     pg_ctl -D /var/lib/postgresql/data -l logfile start
#postgres_1  |
#postgres_1  | initdb: warning: enabling "trust" authentication for local connections
#postgres_1  | You can change this by editing pg_hba.conf or using the option -A, or
#postgres_1  | --auth-local and --auth-host, the next time you run initdb.
#postgres_1  | waiting for server to start....2020-03-09 09:52:00.249 UTC [46] LOG:  starting PostgreSQL 12.2 (Debian 12.2-2.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
#postgres_1  | 2020-03-09 09:52:00.254 UTC [46] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
#postgres_1  | 2020-03-09 09:52:00.292 UTC [47] LOG:  database system was shut down at 2020-03-09 09:52:00 UTC
#postgres_1  | 2020-03-09 09:52:00.297 UTC [46] LOG:  database system is ready to accept connections
#postgres_1  |  done
#postgres_1  | server started
#postgres_1  |
#postgres_1  | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
#postgres_1  |
#postgres_1  | waiting for server to shut down....2020-03-09 09:52:00.338 UTC [46] LOG:  received fast shutdown request
#postgres_1  | 2020-03-09 09:52:00.340 UTC [46] LOG:  aborting any active transactions
#postgres_1  | 2020-03-09 09:52:00.341 UTC [46] LOG:  background worker "logical replication launcher" (PID 53) exited with exit code 1
#postgres_1  | 2020-03-09 09:52:00.341 UTC [48] LOG:  shutting down
#postgres_1  | 2020-03-09 09:52:00.354 UTC [46] LOG:  database system is shut down
#postgres_1  |  done
#postgres_1  | server stopped
#postgres_1  |
#postgres_1  | PostgreSQL init process complete; ready for start up.
#postgres_1  |
#postgres_1  | 2020-03-09 09:52:00.450 UTC [1] LOG:  starting PostgreSQL 12.2 (Debian 12.2-2.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
#postgres_1  | 2020-03-09 09:52:00.450 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
#postgres_1  | 2020-03-09 09:52:00.450 UTC [1] LOG:  listening on IPv6 address "::", port 5432
#postgres_1  | 2020-03-09 09:52:00.453 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
#postgres_1  | 2020-03-09 09:52:00.468 UTC [55] LOG:  database system was shut down at 2020-03-09 09:52:00 UTC
#postgres_1  | 2020-03-09 09:52:00.471 UTC [1] LOG:  database system is ready to accept connections

# Ctrl+C
#Killing dockercompose_drupal_1    ... done
#Killing dockercompose_postgres_1  ... done
docker-compose -f docker-compose-assign-1.yml down -v
#Removing dockercompose_drupal_1   ... done
#Removing dockercompose_postgres_1 ... done
#Removing network dockercompose_default
#WARNING: Network dockercompose_default not found.
#Removing volume dockercompose_drupal-modules
#Removing volume dockercompose_drupal-profiles
#Removing volume dockercompose_drupal-sites
#Removing volume dockercompose_drupal-themes

