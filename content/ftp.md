+++
date = "2017-11-08T11:40:00+09:00"
draft = false
title = "ftp"
categories = [ "engineer" ]
tags = [ "ftp" ]

+++

# cui

## ftp

暗号化されない  

$ ftp (host name)
user: (input)
password: (input)

ディレクトリはアプロードできない  

## ncftp

### ログインして作業

$ ncftp -u (user) -p (password) (remote host name)  

ディレクトリを再帰的にアップロード  
cd, lcdでディレクトリの位置を合わせて  
$ mput -R (directory)  

### 直接アップロード

ディレクトリを再帰的にアップロードする場合  

$ ncftpput -u (user) -p (password) -P (port) -R -m -z (remote host name) (remote directory) (local directory)  

```
-R ディレクトリ以下を再帰的にコピー
-u ユーザ名
-p パスワード
-P ポート番号
-m リモートディレクトリが存在しなければ作る
-z resume transfer (転送途中のファイルがある時、続きを転送)
```

## sftp

sftpで使う  
複数ファイルを扱うときは mget, mputで行える  
