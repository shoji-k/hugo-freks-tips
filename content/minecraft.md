+++
title = "minecraft"
draft = false
date = "2017-03-06T23:31:30+09:00"
categories = [ "memo" ]
tags = [ "minecraft" ]

+++

# build minecraft server

## try on Ubuntu 14.04  
### install java

$ sudo add-apt-repository ppa:webupd8team/java  
$ sudo apt-get update  
$ sudo apt-get install oracle-java8-installer  

confirm  
$ java -version  

```
java version "1.8.0_121"
Java(TM) SE Runtime Environment (build 1.8.0_121-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.121-b13, mixed mode)
```

### install mincraft

download mincraft.jar from https://minecraft.net/ja-jp/download/server  

$ java -Xmx1024M -Xms1024M -jar minecraft_server.1.11.2.jar nogui  

boot once and eula confirmation error  
change false to true on eula.txt  
then reboot  

### connect from local

boot mincraft of same version  
and connect with multiuser  

