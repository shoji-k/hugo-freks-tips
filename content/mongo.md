+++
title = "mongo"
draft = false
date = "2017-04-30T22:39:20+09:00"
categories = [ "engineer" ]
tags = [ "mongodb" ]

+++

mongodbはschemeless  

# naming

| RDB      | mongo      |
|:---------|:-----------|
| table    | collection |
| row      | document   |
| column   | field      |

# command

$ mongo  
$ mongo (database name) -u (user name) -p

# command in mongo

## show databases

show dbs;  

## show collections

use (database name);  
db.getCollectionNames();  

field見るにはfindで  

## create an user

db.createUser({user: "user", pwd: "password", roles:[{ "role": "userAdminAnyDatabase", "db": "admin"}]});

## show users

use admin;
db.system.users.find();

## insert data

schemelessのためcollectionをcreateとかしなくていい  

collection aaa に insert  
db.aaa.insert({name: 'hey', gender: 'm'});  

## find data

db.aaa.find();  
db.aaa.find({gender: 'm'});  

## remove data

db.aaa.find({gender: 'm'});  

