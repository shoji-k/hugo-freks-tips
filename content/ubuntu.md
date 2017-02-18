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
