+++
date = "2017-09-25T22:38:37+09:00"
draft = false
title = "squid"
categories = [ "engineer" ]
tags = [ "squid", "proxy" ]

+++

# use docker

## image

[sameersbn/squid \- Docker Hub](https://hub.docker.com/r/sameersbn/squid/)

## prepare

そのままだとlocalhostからしかつながらない  
設定ファイルを書き換える  

いったんsquid.confをコピーするため起動  

```
docker run --name squid -d --restart=always \
  --publish 3128:3128 \
  --volume $(pwd)/cache:/var/spool/squid3 \
  sameersbn/squid:3.3.8-23
```

squid.confをコピー

```
docker cp squid:/etc/squid3/squid.conf ./
```

コンテナを削除  

```
docker rm -f -v squid
```

squid.confを書き換え

- acl myacl src (your ip address)/255.255.255.255 を追記、ローカルIPアドレスからアクセスできるようにする
- http_access allow myacl を追記
- forwarded_for off を追記でローカルIPアドレスを隠蔽

ローカルIPアドレスの確認は  
[http://httpbin.org/ip](http://httpbin.org/ip)  
が便利  

squild.confを指定して、コンテナ起動

```
docker run --name squid -d --restart=always \
  --publish 3128:3128 \
  --volume $(pwd)/squid.conf:/etc/squid3/squid.conf \
  --volume $(pwd)/cache:/var/spool/squid3 \
  sameersbn/squid:3.3.8-23
```

これで手元のPCのプロキシ設定をして使う  
プロキシ設定
アドレス: ローカルIPアドレス  
ポート: 3128  

[http://httpbin.org/ip](http://httpbin.org/ip)  
でアドレスがプロキシののみ表示されることを確認  

