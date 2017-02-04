+++
draft = false
date = "2017-02-04T16:32:47+09:00"
title = "ansible"
categories = [ "engineer" ]
tags = [ "ansible" ]

+++

sshでサーバーにつながるように準備しておく

#### start

create inventory file  

$ vim /etc/ansible/hosts (globalにansibleが認識)  
or  
$ vim hosts (local)  

```
[servers]
sample
server
```

2 servers are written  
[xxxx] is a group name  
server name is used in ssh/config  

$ ansible all -m ping  
or  
$ ansible servers -m ping  
$ ansible sample -m ping  

sample is one server name  
servers is a group name  
ping is one module of ansible  

localの場合 -i で inventory file を指定  
$ ansible all -i hosts -m ping  

#### to vagrant

set vagrant ssh to .ssh/config  
$ vagrant ssh-config ansible >> ~/.ssh/config  

try ssh to vagrant  
$ ssh ansible  

#### playbook

check syntax  
$ ansible-playbook sample.yml --syntax-check  

implement  
$ ansible-playbook -i hosts -t wp -K sample.yml  

- -i set hosts
- -t set tag
- -K ask sudo password

