+++
draft = false
date = "2016-11-24T18:30:59+09:00"
title = "docker compose"
categories = [ "engineer" ]
tags = [ "docker" ]

+++

# install

reffer to:  
[Install Compose](https://docs.docker.com/compose/install/)

# docker-compose.yml

assign image  
```
image: httpd:lastst  
```

assign image built by Dockerfile  
```
build: .  
```

set command (use bash)  
```
command: /bin/bash  
```

write container to hosts file  
```
links:
- dbserver  
- dbserver:mysql  
```

hosts file is written  
```
192.168.100.10 dbserver
192.168.100.10 mysql
```

write container not in same docker-compose.yml to hosts file  
```
external_links:
- dbserver  
- dbserver:mysql  
```

set open port  
```
ports:
- "3000"  
- "8080:80"  
```

set open port only for containers (not for host)  
```
expose:
- "3000"  
- "8080"  
```

mount volume  
```
volumes:
- /var/log/mysql
- /home/user/mysqllog:/var/log/mysql
- ~/configs:/etc/configs/:ro
```

mount all volumes to another container  
```
volumes_from:
- log
```

set environment  
```
environment:
- bar=foo
```

set container name  
container_name: web_app

# docker-compose.yml v.3

```
services:
  node:
    volumes:
      - node_modules:/app/node_modules

volumes:
  node_modules:
    driver: local
```

## commands

create and boot containers  
docker-compose up

create and boot containers in background  
docker-compose up -d

stop one container  
docker-compose stop (container name)

show containers  
docker-compose ps

show logs  
docker-compose logs

implement command  
docker-compose run (container name) /bin/bash

start containers  
docker-compose start

stop containers  
docker-compose stop

force stop containers  
docker-compose kill

remove containers  
docker-compose rm

## prepare wordpress environment

prepare datastore container  

```
FROM busybox
MAINTAINER 0.1 sample@sample.com
VOLUME /var/lib/mysql
```

VOLUME means saving directory  

create dataonly image  
$ docker build -t dataonly .

create dataonly container and start  
$ docker run --name dataonly dataonly

preapre docker-compose.yml  
```
webserver:
  image: wordpress
  ports:
    - 8080:80
  links:
    - "dbserver:mysql"

dbserver:
  image: mysql
  volumes_from:
    - dataonly
  environment:
    MYSQL_ROOT_PASSWORD: password
```

boot  
$ docker-compose up -d

connect mysql  
use another container to connect  
$ docker run -it --link (mysql container):mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

or  
$ docker exec -it wordpress_dbserver_1 sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD'

dump all databases  
$ docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql

dump one database (wordpress)  
$ docker exec some-mysql sh -c 'exec mysqldump wordpress -uroot -p"$MYSQL_ROOT_PASSWORD"' > dump.dbbackup

dump tables  
$ docker exec container_name sh -c 'exec mysqldump -uroot -ppassword -t sample_database table_name' > table.dbbackup

restore sql  
$ docker exec -i container_name mysql sample_database -uroot -ppassword < dump.sql

# delete docker volumes

$ docker volume rm $(docker volume ls -qf dangling=true)

# mysql image

docker run command  
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql

# implement rails commands

$ docker-compose run (app name) rails generate scaffold Article title:string  
$ docker-compose run (app name) rake db:migrate  

## refferences

[library/mysql \- Docker Hub](https://hub.docker.com/_/mysql/)

