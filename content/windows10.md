+++
date = "2017-05-11T16:33:15+09:00"
title = "windows10"
draft = false
categories = [ "engineer" ]
tags = [ "windows" ]

+++

# first

- Windows Update
- Dell Update (Dellの場合)
- 不要なアプリを削除

# CapsLockにCtrlを割り当てる

[Ctrl2cap](https://technet.microsoft.com/en-us/sysinternals/bb897578.aspx)を使う  

ダウンロードしてexeを実行する  
管理者権限が必要なので、コマンドプロンプトを右クリック、管理者権限で実行する  

```
> ctrl2cap.exe /install
```

# install applications

- Google Chrome
  - synchronize in setting menu
- Vivaldi
  - pin: toggl
  - pin: feedly
  - pin: trello
  - pin: paper
  - pin: google music
- Gyazo
- kindle
- Shift
  - two inbox
- Franz
  - other inboxes
  - TweetDeck
  - Chatwork
  - Slack(main account)
  - Messenger
- Slack(temporary account)
- VS Code
- Sublime Text
- BoW
- Google Drive File Stream [ドライブ ファイル ストリームを導入する \- G Suite 管理者 ヘルプ](https://support.google.com/a/answer/7491144)

### cmder

[Bash on Windows \+ cmderでまともなターミナルを獲得する\(tmuxに関する追記有り\) \- Qiita](http://qiita.com/yutaszk/items/fb77435296b131fd0a3a)  

vimやtigで画面横分割した際に、マルチバイトが崩れる (2017-09-18 現在)

### mintty

bash on windows 用のインストーラー  
[mintty/wsltty: Mintty as a terminal for Bash on Ubuntu on Windows / WSL](https://github.com/mintty/wsltty)  

[Bash on Ubuntu on Windows で快適日本語ターミナル \- Qiita](http://qiita.com/alt-core/items/3eff6308fde7d2a28bdc)  
をベースに  

[4bit\. Terminal Color Scheme Designer](http://ciembor.github.io/4bit/)
でカラースキーマを用意

.minttyrcがみつからなかったが  
AppData\Roaming\wsltty\themes\color  
にファイルを用意して、設定画面からthemeを選ぶと適用された  

ディレクトリの色が見づらい分を調整  
$ dircolors -p > ~/.dircolors
$ vim ~/.dircolors

## install php

$ sudo apt-get install software-properties-common python-software-properties  
$ sudo add-apt-repository ppa:ondrej/php  
$ sudo apt update  
$ sudo apt install php7.1  

### php server

$ sudo php -S localhost:80 index.php

## Bash on Windows

- upgrade git, setting
- ssh client setting
- mosh
- nvim
- tig

## windows store

- line
- facebook
- OneNote (default installed)

## Control Panel

- 設定 >バージョン情報
  - PC名変更
- ディスプレイのカスタマイズ
  - テキスト、アプリ、その他の項目のサイズを変更する
- アップデートとセキュリティ > 開発者モード
  - 開発者モードを有効にする(for BoW)

# ショートカット

Windows + ←→→ ウィンドウを半分にする  
Windows + CTRL + D 新しいデスクトップを作成  
Windows + CTRL + ←→  デスクトップを切り替え  
Windows + CTRL + F4  デスクトップを削除  
Windows + SHIFT + S スクリーンショットがクリップオードに、ペーストできる

# タッチパッド

## 3本指スワイプ

アプリケーション切り替え

## ４本指スワイプ

デスクトップ切り替え
