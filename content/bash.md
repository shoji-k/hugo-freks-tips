+++
date = "2017-07-06T17:10:23+09:00"
draft = false
title = "bash"
categories = [ "engineer" ]
tags = [ "bash", "git" ]

+++

# git管理下であるときからの変更分のファイルを取り出す

copyディレクトリを作っていれる  

git log でハッシュ値を取る  
$ git diff --name-only xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx..HEAD > diffname.txt  
$ mkdir copy  
$ cat diffname.txt | while read line; do cp --parents $line ./copy ; done  

# ディレクトリを上書きする

$ cp -r copy -T ../somedirectory/
