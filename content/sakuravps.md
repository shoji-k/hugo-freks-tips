+++
title = "sakura vps"
draft = false
date = "2017-02-04T14:58:30+09:00"
categories = [ "engineer" ]
tags = [ "sakura", "vps", "centos7", "ubuntu" ]

+++

[VPS（仮想専用サーバー）｜さくらインターネット ](http://vps.sakura.ad.jp/) を契約する

初期設定リファレンス [【さくらのVPS】サーバの初期設定ガイド – さくらのサポート情報](https://help.sakura.ad.jp/hc/ja/articles/206208181)

# ubuntu 16.04

sakura用意の標準OSだとufwの設定が動かなかったので断念..  
カスタマイズのOSを選択  

最初からsudoが使え、ufwも使える  

## firewall

ufwは全て許可になってるので全部閉じる  
$ sudo ufw default deny  

必要なものを許可する  
$ sudo ufw allow ssh  

対応したアプリを表示  
$ sudo ufw app list  

設定を確認  
numberedで番号も表示  
$ sudo ufw status numbered  

設定を削除  
$ sudo ufw delete (number)  

## ssh

ssh用の秘密鍵を生成しておく  
公開鍵をサーバーへコピー  

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
- usePAM no

Portはファイアーウォールの設定もあわせて変える

ssh再起動

```
$ sudo systemctl restart ssh.service
```

## ntp

ntpdはsystemdがやっている

$ vi /etc/systemd/timesyncd.conf  

```
NTP=ntp.nict.jp
```

再起動後有効になる  

確認  
$ sudo systemctl -l status systemd-timesyncd.service  

## locate

$ sudo apt install language-pack-ja

locale変更  
$ sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="en_Us:en"

ファイル名は日本語表示、メッセージは英語  

locale確認  
$ localectl

## vim

sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

# centos 7

管理画面へログイン、OSをインストールする

- root パスワードを入力

## ユーザー追加

管理画面のコンソールでの作業  

```
$ useradd user
$ passwd user
(enter password twice)
```

## ユーザーにsudo追加

```
$ usermod -G wheel user
$ visudo
%wheel ALL=(ALL) ALL を有効に
```

## sshログイン

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

## firewalld設定

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

## centos update

```
$ sudo yum update
```

## open http port of firewall

```
$ sudo firewall-cmd --add-service=http --zone=public
$ sudo firewall-cmd --add-service=https --zone=public
```

## git

git was already installed  
so do config  

## nginx

repository登録  
$ vim /etc/yum.repos.d/nginx.repo

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
```

install  
$ sudo yum -y --enablerepo=nginx install nginx


# ネットワークが遅い

refference:

- [さくらのVPSで回線速度が遅くアクセスに時間がかかります。 – さくらのサポート情報](https://help.sakura.ad.jp/hc/ja/articles/206073662)

$ sudo ethtool -k ens3 | grep tcp

```
tcp-segmentation-offload: off
        tx-tcp-segmentation: off
        tx-tcp-ecn-segmentation: off
        tx-tcp6-segmentation: off
```

再起動して確認する  

試用期間はネットワークが制限される  
- [お申し込みのながれ｜VPS（仮想専用サーバー）はさくらインターネット](http://vps.sakura.ad.jp/flow/)
