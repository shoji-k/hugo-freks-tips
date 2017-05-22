+++
title = "linux command"
draft = false
date = "2017-01-20T13:06:40+09:00"
categories = [ "engineer" ]
tags = [ "linux", "command" ]

+++

# delete 0 byte file

$ find . -maxdepth 1 -size 0 -print | xargs rm

# さっきいたディレクトリに戻る

$ cd -

# 文字化けしたファイル名を修正する

find . -maxdepth 1 -type f | xargs convmv -f sjis -t utf8

# 改行コードを変更

インストール  
$ sudo apt install nkf  

改行コードをlfに変更  
$ nkf -Lu --overwrite sample.txt  

git diffの結果にだけ対応  
git管理下のトップディレクトリで実行  
$ git diff --name-only | xargs nkf -Lu --overwrite  

# tarファイルに圧縮

$ tar cvf sample.tar sample

# プロセス確認

$ top  

プロセスを表示  
$ ps aufx  

```
a 自分以外のプロセスも表示
x デーモンプロセスを表示
u ユーザー名と開始時刻を表示
f 子プロセスも表示
```

プロセスxxxの開いているファイルを表示  
$ lsof -p xxx  

25ポートを使っているプロセスを表示  
$ lsof -i :25  

# ネットワーク確認

$ netstat

```
a 全ての接続を表示
n 名前解決しない
l listenしてるもののみ
p プログラム名を表示
```

# cron

## 全ユーザーのcrontab

/var/spool/cron  
を参照する
