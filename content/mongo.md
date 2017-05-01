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

# docker

image: [mongo](https://hub.docker.com/_/mongo/)  

docker-compose

```
version: '2'
services:
  mongo:
    container_name: mongo
    image: mongo
    ports:
    - "27017:27017"
    volumes:
    - ./mongo/data:/data/db
    - ./mongo/init/:/docker-entrypoint-initdb.d/
    environment:
    - MONGO_INITDB_DATABASE=fluentd
```

MONGO_INITDB_DATABASE is the database where initial script creates users.  
(see /docker-entry.point in the container)  

data is preserved in ./mongo/data  

initialize script is in ./mongo/init  

```
var newUsers = [
  {
		user: 'logger',
		pwd: 'password',
		roles: [
			{
				role: 'readWrite',
				db: 'fluentd'
			}
		]
	}
];

var currentUsers = db.getUsers();
if (currentUsers.length === newUsers.length) {
	quit();
}
db.dropAllUsers();

for (var i = 0, length = newUsers.length; i < length; ++i) {
	db.createUser(newUsers[i]);
}
```

refference: [fluentd \+ MongoDB でログサーバー構築 \- Qiita](http://qiita.com/janus_wel/items/daf19943837e2562cc9f)  

