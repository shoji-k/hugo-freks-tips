+++
title = "sakura vps"
draft = false
date = "2017-02-04T14:58:30+09:00"
categories = [ "engineer" ]
tags = [ "sakura", "vps", "centos7" ]

+++

[VPS（仮想専用サーバー）｜さくらインターネット ](http://vps.sakura.ad.jp/)
を契約する

管理画面へログイン、OSをインストールする

- Centos 7 64bit
- root パスワードを入力

初期設定リファレンス [【さくらのVPS】サーバの初期設定ガイド – さくらのサポート情報](https://help.sakura.ad.jp/hc/ja/articles/206208181)


#### ユーザー追加

管理画面のコンソールでの作業  

```
$ useradd user
$ passwd user
(enter password twice)
```

#### ユーザーにsudo追加

```
$ usermod -G wheel user
$ visudo
%wheel ALL=(ALL) ALL を有効に
```

#### sshログイン

ssh用の秘密鍵を生成しておく  
公開鍵をサーバーへコピー  

rootユーサーでsshログイン  

```
$ mkdir .ssh
$ chmod 700 .ssh
$ cat id_rsa.pub > .ssh/authorized_keys
$ chmod 600 .ssh/authorized_keys
$ rm -f id_rsa.pub
```

sshサーバーの設定変更

```
$ sudo vi /etc/ssh/sshd_config
```

- Port 22
- PermitRootLogin no
- PasswordAuthentication no

Portはファイアーウォールの設定もあわせて変える

ssh再起動

```
$ sudo systemctl restart sshd.service
```

#### firewalld設定

デーモン確認

```
$ sudo systemctl restart firewalld.service
```

設定確認

```
$ firewall-cmd --list-services
$ sudo cat /usr/lib/firewalld/services/ssh.xml
```

SSHのポート番号変更

```
$ sudo vi /usr/lib/firewalld/services/ssh.xml
$ sudo vi /etc/ssh/sshd_config
```

サービス再起動

```
$ sudo systemctl restart sshd.service
$ firewall-cmd --reload
```

sshログの確認

```
journalctl -u sshd.service
```





