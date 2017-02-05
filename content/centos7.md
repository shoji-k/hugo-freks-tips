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

