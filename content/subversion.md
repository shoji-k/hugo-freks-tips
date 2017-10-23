+++
title = "subversion"
draft = false
date = "2016-11-26T12:40:49+09:00"
categories = [ "engineer" ]
tags = [ "subversion" ]

+++

# install

xenial  
$ sudo apt install subversion

# commands

svn checkout http://(リポジトリ）  
チェックアウトしてファイルをダウンロード  

svn update .  
リポジトリから最新をダウンロード  

svn add (file)  
(file)をsubversionの管理下へいれます  

svn delete (file)  
(file)を削除します  

svn commit -m 'コメント'  
コメントをつけてコミットします（リポジトリに送り込む）  

svn info  
リポジトリの情報を表示  

svn log -l 5  
ログを最新５件表示  

svn diff  
コミットしてないものの差分を表示  

svn diff -r r30:head  
リビジョンr33からheadまでの差分を表示（リビジョンはsvn infoで見れる）  
