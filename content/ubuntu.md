+++
title = "ubuntu"
draft = false
date = "2017-01-16T16:34:24+09:00"
categories = [ "engineer" ]
tags = [ "ubuntu" ]

+++

#### Windowを移動する

ウィンドウが見えない場所へ移動してしまった時  
Alt + F7  

#### Androidと画面共有

- use desktop sharing
- implement $ gsettings set org.gnome.Vino require-encryption false

[Ubuntu系Linuxに標準で入っているデスクトップ共有を試してみる \| 気ままにライフ](http://kimamanilife.com/archives/459)

#### デーモン起動

設定を確認

```
$ sysv-rc-conf --list
```

ON or OFF

```
$ sysv-rc-conf apache2 on
$ sysv-rc-conf apache2 off
```

#### repository削除

$ sudo add-apt-repository --remove ppa:sample/xxx

# dpkg

## install

$ dpkg -i xxxx

## list

$ dpkg -l | grep xxx

## uninstall

$ dpkg -r xxx

# speedtest

$ sudo easy_install speedtest-cli  
$ speedtest --list | grep Japan

```
 6476) rxy (individual) (Osaka, Japan) [1.83 km]
 8832) OMN (Ikeda, Japan) [16.88 km]
 6368) gatolabo (Maibara, Japan) [98.72 km]
11385) buriitto (Suzuka, Japan) [99.54 km]
 7976) denpa893 (Hikari, Japan) [338.27 km]
 8407) Allied Telesis Capital Corporation (Sagamihara, Japan) [363.95 km]
```

$ speedtest --server 11385

```
Retrieving speedtest.net configuration...
Testing from Sakura Internet (153.126.180.234)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by buriitto (Suzuka) [99.54 km]: 57.443 ms
Testing download speed................................................................................
Download: 54.21 Mbit/s
Testing upload speed................................................................................................
Upload: 4.58 Mbit/s
```

# needed software

clipboard  
$ sudo apt install xsel  

tig  
$ sudo apt install tig  

mosh--
$ sudo apt install mosh  
$ sudo ufw allow mosh  

tree  
$ sudo apt install tree  

ctags  
$ sudo apt install exuberant-ctags  

# terminal color

## show terminal color

$ dircolors -p  

## change terminal color

$ dircolors -p > ~/.dircolors

and change ~/.dircolors  
and reload .bashrc  

# check to restart

$ sudo apt install debian-goodies
$ sudo checkrestart -a

# tool

## pdftohtml

install  
$ sudo apt install poppler-utils  

show pdf in terminal  
$ pdftohtml sample.pdf -stdout  
