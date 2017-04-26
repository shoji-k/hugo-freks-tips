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

### rootize

エラーログなど権限不足で読めないので、td-agentをrootで起動する  

```
$ sudo vim /etc/init.d/td-agent

TD_AGENT_USER=root
TD_AGENT_GROUP=root

$ service td-agent restart
```

### example 1

nginx access logをtd-agent.logに出力する

$ vim /etc/td-agent/td-agent.conf  

```
<match debug.**>
  @type stdout
</match>

<source>
  @type tail
  path /var/log/nginx/sample-access.log
  tag debug.sample-access
  pos_file /var/log/td-agent/sample-access.log.pos
  format /^(?<remote>[^ ]*) (?<host>[^ ]*) (?<user>[^ ]*) \[(?<time>[^\]]*)\] "(?<method>\S+)(?: +(?<path>[^ ]*) +\S*)?" (?<code>[^ ]*) (?<size>[^ ]*)(?: "(?<referer>[^\"]*)" "(?<agent>[^\"]*)" "(?<forwarder>[^\"]*)")?/
  time_format %d/%b/%Y:%H:%M:%S %z
</source>
```

$ tail /var/log/td-agent/td-agent.log

```
2017-02-15 21:26:44 +0900 debug.sample-access: {"remote":"xxx.xxx.xxx.xxx","host":"-","user":"-","metho
6_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36","forwarder":"-"}
```

# use docker

prepare conf  
localhost:24224(TCP)で受けて標準出力する

```
<source>
@type forward
</source>

<match *>
@type stdout
</match>
```

fluentdコンテナ起動  
$ docker run -it -p 24224:24224 -v /path/to/conf/test.conf:/fluentd/etc/test.conf -e FLUENTD_CONF=test.conf fluent/fluentd:latest  

コンソール上で起動(Ctrl + Cでストップ)

他のdockerコンテナをfluentdログドライバーで起動  
$ docker run --log-driver=fluentd your/application

ログがfluentdコンテナを起動したコンソールで表示される


