+++
date = "2017-02-22T12:01:25+09:00"
title = "docker machine"
draft = false
categories = [ "engineer" ]
tags = [ "docker" ]

+++

# install

see [Install Docker Machine \- Docker](https://docs.docker.com/machine/install-machine/)

# commands

managerのホスト名のvirtual machineを用意  
$ docker-machine create --driver virtualbox manager

virtual machine一覧  
active * はシェルがつながっているもの

$ docker-machine ls

```
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER    ERRORS
manager   *        virtualbox   Running   tcp://192.168.99.100:2376           v1.13.1   
worker    -        virtualbox   Running   tcp://192.168.99.101:2376           v1.13.1  
```

IPを表示  
$ docker-machine ip manager

環境変数を表示  
$ docker-machine env manager

手元のシェルとvirutal machineのシェルをつなぐ  
$ eval $(docker-machine env manager)

managerへsshログイン  
$ docker-machine ssh manager

```
                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/
 _                 _   ____     _            _
| |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
| '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
|_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
Boot2Docker version 1.13.1, build HEAD : b7f6033 - Wed Feb  8 20:31:48 UTC 2017
Docker version 1.13.1, build 092cba3
```

initialize swarm  
docker@manager:~$ docker swarm init --advertise-addr 192.168.99.100

```
Swarm initialized: current node (vr7gm59os0kbgeou8oickuv3y) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-69gbc5d50la1ta5mtk67lrno5phgoqq4ebaztnf4h91dj6era3-71p3dn14eu6zhumv0p254r3xy \
    192.168.99.100:2377
```

workerにsshログイン、swarn init後のコマンドを実行  

```
docker@worker:~$  docker swarm join \
>     --token SWMTKN-1-69gbc5d50la1ta5mtk67lrno5phgoqq4ebaztnf4h91dj6era3-71p3dn14eu6zhumv0p254r3xy \
>     192.168.99.100:2377
This node joined a swarm as a worker.
```

nodeを表示  

docker@manager:~$ docker node ls

```
ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
vr7gm59os0kbgeou8oickuv3y *  manager   Ready   Active        Leader
y2y9i98fd78f5qzvi3o5kuj18    worker    Ready   Active  
```

prepare docker-stack.yml and deploy  

docker@manager:~$ docker stack deploy --compose-file docker-stack.yml vote

確認する  
docker@manager:~$ docker stack services vote


