
title = "elasticsearch"
draft = true
date = "2017-02-13T22:42:55+09:00"
categories = [ "engineer" ]
tags = [ "elasticsearch" ]

+++

# use docker

see [library/elasticsearch \- Docker Hub](https://hub.docker.com/_/elasticsearch/)

Virtual memory設定を変える

```
sysctl -w vm.max_map_count=262144
```

elasticsearch立ち上げる

```
$ docker pull elasticsearch
$ docker run --name elast -d -p 9200:9200 -p 9300:9300 -e ES_JAVA_OPTS="-Xms512m -Xmx512m" elasticsearch
```

メモリがない環境だったので`ES_JAVA_OPTS`をつけた  
搭載しているメモリの半分が上限の目安  


動作確認

```
curl -XGET http://localhost:9200/
```

jsonが返ってくる

状態確認

```
curl -XGET http://localhost:9200/_cluster/health?pretty
```

# elasticsearch + kibana docker compose

```
version: '2'
services:
  elast:
    image: elasticsearch
    ports:
      - "9200:9200"
      - "9300:9300"
    environment:
      - ES_JAVA_OPTS=-Xms512m -Xmx512m
  kibana:
    image: kibana
    ports:
      - "5601:5601"
    links:
      - elast:elasticsearch
```
