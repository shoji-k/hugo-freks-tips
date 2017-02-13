+++
title = "centos7"
draft = false
date = "2017-02-05T13:00:30+09:00"
categories = [ "engineer" ]
tags = [ "centos7" ]

+++

#### centos update

```
$ sudo yum update
```

#### firewalld

reload firewalld  

```
$ sudo firewall-cmd --reload
```

open http port of firewall  

```
$ sudo firewall-cmd --add-service=http --zone=public --permanent
$ sudo firewall-cmd --add-service=https --zone=public --permanent
```

open and close port  

```
$ sudo firewall-cmd --add-port=30080/tcp --zone=public --permanent
$ sudo firewall-cmd --remove-port=30080/tcp --zone=public --permanent
```

#### yum

yum install時に使われるrepositoryは`/etc/yum.repos.d/`内にあって、enable=1のもの  
`enable=0`のものを指定するには

```
sudo yum install --enablerepo=epel certbot
```

yumでインストールしたパッケージ一覧

```
sudo yum list installed
```

アップデート

```
sudo yum install certbot
```

削除

```
sudo yum remove certbot
```

