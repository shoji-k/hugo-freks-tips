+++
title = "fluentd"
draft = false
date = "2017-02-13T15:33:20+09:00"
categories = [ "engineer" ]
tags = [ "fluentd" ]

+++

### prerequirement

see [Before Installing Fluentd \| Fluentd](http://docs.fluentd.org/v0.12/articles/before-install)  

コマンドが扱えるファイルの数を確認  

```
$ ulimit -n
```

1024だと足りないので

```
$ sudo /etc/security/limits.conf

root soft nofile 65536
root hard nofile 65536
* soft nofile 65536
* hard nofile 65536
```

を追記、再起動（VPSだとログアウト、ログインで変更された）  

kernel parameterを変えるのは他に影響が出そうだったのでスキップ  

### install

#### ubuntu 14.04 trusty

register td-agent repository, install td-agent and boot td-agent deamon  

```
$ curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh
```

### test

throw one request to td-agent  

```
curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test
```

confirm log

```
cat /var/log/td-agent/td-agent.log
```

### service

start, stop, etc..

```
$ sudo /etc/init.d/td-agent start
$ sudo /etc/init.d/td-agent stop
$ sudo /etc/init.d/td-agent restart
$ sudo /etc/init.d/td-agent status
```

### check processes

プロセスは２つ起動しているのが正しい

```
$ ps aufx | grep td-agent
```

### directive

設定ファイル

```
$ sudo vim /etc/td-agent/td-agent.conf 
```

#### \<system>

Fluentdのコアの動作を設定

#### \<source>

ログの入力元を設定

#### \<match>

ログの出力先を設定

#### \<include>

外部ファイルの設定を読み込む

