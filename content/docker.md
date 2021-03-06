+++
title = "docker"
draft = false
date = "2016-11-24T16:39:26+09:00"
categories = [ "engineer" ]
tags = [ "docker" ]

+++

# install

reffer to:  
[Install Docker and run hello\-world \- Docker](https://docs.docker.com/engine/getstarted/step_one/)  
Centos 7: [Get Docker for CentOS \- Docker](https://docs.docker.com/engine/installation/linux/centos/)

non-root user: [Post\-installation steps for Linux \- Docker](https://docs.docker.com/engine/installation/linux/linux-postinstall/)  

$ curl -fsSL https://get.docker.com/ | sh  
$ sudo usermod -aG docker user  
$ sudo service docker restart  

logout once and login again not to need to use sudo  

$ curl -fsSL https://get.docker.com/gpg | sudo apt-key add -  

$ docker -v  

```
Docker version 1.11.0, build 4dc5990
```

check docker  
$ docker run hello-world

go into inside on bash  
$ docker run -it ubuntu bash  

# commands

show downloaded docker images  
$ docker images

run ubuntu container and run a command.  
if ubuntu isn't downloaded, it starts downloading it.  
docker container is booted once and stops.  
$ docker run --name sample ubuntu cat /etc/lsb-release  

show all containers (includes stopped one)  
$ docker ps -a  

show container details  
$ docker inspect (id)

search docker images in dockerhub
$ docker search nginx

remove stopped container  
$ docker rm (id)  

delete all docker containers  
$ docker rm $(docker ps -aq)  

remove an docker image  
$ docker rmi (image)

delete all docker images  
$ docker rmi $(docker images -q)  

stop docker  
$ docker stop (id)  

start a stopped container  
$ docker start (id)  

run one command in a working container  
$ docker exec (id) md5sum /etc/nginx/nginx.conf  

implement bash  
$ docker exec -i -t (id) /bin/bash

show docker logs  
-t show time  
$ docker logs -t (id)

show image detail
$ docker inspect (image)

attache deamon container  
$ docker attach (id)  

show docker status  
$ docker stats (id) (id) ..

show container process  
$ docker top (container id)

show port transffer of container  
$ docker port (container id)

change container name  
$ docker rename (old) (new)

copy file between host and docker container  
$ docker cp file (container id):file  
$ docker cp (container id):file file

show differences between image and container  
$ docker diff (container id)

show docker information  
$ docker info

create images from container  
$ docker commit (container id) (image name:tag name)

export container  
export and import is pair  
this tar file includes directory hierarchy  
$ docker export container > (file.tar)

import image from exported container tar file  
$ docker import (file) (image name:tag name)

save docker image to tar  
save and load is pair  
save as layer  
$ docker save -o (file) (image name)

load saved docker image file  
$ docker load -i (file)

verify network  
inspect command can show the network of the container  
$ docker network ls

let the container join the specified network  
$ docker run -d --net=my-bridge-network --name db training/postgres  

change the network  
$ docker network connect my-bridge-network web  

show container volumes  
$ docker volume ls

show container dangling volumes  
this is remained when to delete containers with volume container  
$ docker volume ls -qf dangling=true  

clean up dangling volumes  
$ docker volume rm $(docker volume ls -qf dangling=true)  

back up and restore data  
$ docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata  
$ docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"  

# docker run parameters

-d -> deamon  
-P -> connect port between the host and the container  
--name -> container name  
-e -> set env  
-v -> bind directory  
$ docker run -d -P --name=server -e myenv=foo -v ~/:/usr/share/local/nginx/html nginx  

bind ports  
-p 60000-60030:60000-60030 -p 8080:80  

--link (id):(alias)  
you can set alias by yourself  
$ docker run --link (id):(alias) ubuntu  

$ docker run --link server:ngx ubuntu env | grep -i _port

```
NGX_PORT=tcp://172.17.0.2:80
NGX_PORT_80_TCP=tcp://172.17.0.2:80
NGX_PORT_80_TCP_ADDR=172.17.0.2
NGX_PORT_80_TCP_PORT=80
NGX_PORT_80_TCP_PROTO=tcp
NGX_PORT_443_TCP=tcp://172.17.0.2:443
NGX_PORT_443_TCP_ADDR=172.17.0.2
NGX_PORT_443_TCP_PORT=443
NGX_PORT_443_TCP_PROTO=tcp
```

--rm automatically remove the container if it exists  
$ docker run --rm --link server:ngx ubuntu cat /etc/hosts  

# prepare Dockerfile and run

$ vim Dockerfile

```
FROM centos:7
MAINTAINER sample taro <taro@sample.co.jp>
RUN yum -y install epel-release
RUN yum -y install httpd
EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
```

$ docker build -t (image name:tag name) .

# Dockerfile

RUN  
this is used to create docker image

shell type  
implement on /bin/sh  
RUN echo こんにちは

exec type  
this doesn't use /bin/sh  
RUN ["echo, "こんにちは"]

exec type  
RUN ["/bin/bash", "-c", "echo 'こんにちは'"]

CMD  
implement command  
this can be overwritted docker run parameters  

start deamon using shell type  
CMD /usr/sbin/httpd -D FOREGROUND

start deamon using exec type  
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

ENTRY POINT  
implement command  
this can't be overwritted docker run parameters  
e.g. $ docker run -d -p 81:80 sample /usr/sbin/nginx -g "daemon off;"  

start deamon using ENTRYPOINT shell type  
ENTRYPOINT /usr/sbin/httpd -D FOREGROUND  

start deamon using ENTRYPOINT exec type  
ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]

place web files when building  
this create new images  
ONBUILD website.tar /var/www/html/

set environment parameter  
ENV myName "taro"

set working directory  
equals to cd sample  
WORKDIR sample

assign implement user  
USER sample

set label  
SET samplelabel

expose port  
EXPOSE 8080

add file or directory  
this can add tar file, then automatically untar  
ADD index.html /var/www/html/  
ADD sample.tar /var/www/html/  
ADD http://sample.com/index.html /var/www/html/  

copy file or directory  
COPY index.html /var/www/html/

docker-build sends all files in same directory,  
so prepare .dockerignore file

mount volume  
MOUNT /var/log/httpd

charater  
RUN locale-gen ja_JP.UTF-8  
ENV LANG ja_JP.UTF-8  
ENV LANGUAGE ja_JP:ja  
ENV LC_ALL ja_JP.UTF-8  

# prepare private repository and push

use registory image  
tag 2.0 is created by go-lang  
docker pull registory:2.0  

run repository  
if this container is stopped, registered image is gone  
this needs to mount or something  
docker run -d -p 5000:5000 registry:2.0  

name ruled image name  
docker tag (local image) localhost:5000/(image name)

push image  
docker push localhost:5000/(image name)

pull image  
docker pull localhost:5000/(image name)

# push to hub.docker

create account on https://hub.docker.com/  
$ docker tag docker-whale shojik/docker-whale:latest  
$ docker login --username=shojik --email=sample@sample.com  

save token to ~/.docker/config.json  

$ docker push shojik/docker-whale  

## implement composer install

use [composer \- Docker Hub](https://hub.docker.com/_/composer/)

docker pull composer  
move the directory include composer.json  
$ docker run --rm -v $(pwd):/app composer install  

# backup mysql data container

backup  
$ docker run --rm --volumes-from dataonly -v $(pwd):/backup dataonly tar cvf /backup/backup.tar /var/lib/mysql

restore  
$ docker run --rm --volumes-from dataonly -v $(pwd):/backup dataonly sh -c "cd /var/lib/ && tar -xvf /backup/backup.tar"

## security check

see [docker/docker\-bench\-security: The Docker Bench for Security is a script that checks for dozens of common best\-practices around deploying Docker containers in production\.](https://github.com/docker/docker-bench-security)

コマンド実行すると、判定してくれる

```
$ docker run -it --net host --pid host --cap-add audit_control \
    -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /var/lib:/var/lib \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/lib/systemd:/usr/lib/systemd \
    -v /etc:/etc --label docker_bench_security \
    docker/docker-bench-security
```

## logging

show application logs to use `docker logs`

```
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
```

## refferences

- [Dockerのライフサイクルを理解するハンズオン資料 - Qiita](http://qiita.com/zembutsu/items/d146295cfcf69c205c1e)
- [実例で学ぶDockerハンズオン - Qiita](http://qiita.com/kohey18/items/dffe9b11d330576ab852)
- [プログラマのためのDocker教科書 インフラの基礎知識＆コードによる環境構築の自動化](http://amzn.to/2dNjPdn)
