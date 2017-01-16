+++
date = "2017-01-16T16:19:13+09:00"
title = "mysql"
draft = false
categories = [ "engineer" ]
tags = [ "mysql" ]

+++

# install

sudo apt-get install mysql-server  
sudo apt-get install php5-mysql  

$ sudo vi/etc/mysql/my.cnfにあるので、viか何かで開いて、下記設定を追加。  

```
[client]
default-character-set=utf8
[mysqld]
skip-character-set-client-handshake
character-set-server = utf8
collation-server = utf8_general_ci
init-connect = SET NAMES utf8
```

$ sudo /etc/init.d/mysql restart  
$ sudo mysql -u root -p  
$ mysql> status  
文字コードがuft8になっているか確認  

# login
mysql -u root -p  

# backup
mysqldump -u root -p (database name) > dump  

# restore
mysql -u root (database name) < dump  

# create user
GRANT ALL PRIVILEGES ON *.* TO (user name)@localhost IDENTIFIED BY 'password';  
FLUSH PRIVILEGES;  

# delete user
DELETE FROM mysql.user WHERE user='ユーザ名' AND host='localhost';  
or  
drop user sample@localhost;  

# show users
select user, host, password from mysql.user;  

# create database
CREATE DATABASE (database name) CHARACTER SET utf8;  

# delete database
drop database sample;  

# show databases
show databases;  

# connect
mysql -u user -h hostname -P portnum -p (database name)  
