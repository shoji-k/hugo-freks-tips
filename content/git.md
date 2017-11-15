+++
draft = false
title = "git"
date = "2017-02-04T18:40:36+09:00"
categories = [ "engineer" ]
tags = [ "git" ]

+++

# install

$ sudo add-apt-repository ppa:git-core/ppa  
$ sudo apt update  
$ sudo apt install git  

## connect to github tip by original key name

$ vim ~/.ssh/config

```
Host github.com
  Hostname github.com
  User git
  IdentityFile ~/.ssh/githubkey
```

# tips

## checkout tag

$ git checkout -b branch-name tags/<tag-name>  

## checkout remote branch

$ git checkout -b local-branch-name origin/remote-branch-name  

## delete branch

手元のブランチを削除する  
$ git branch -d (sample)  

リモートリポジトリのブランチを削除する  
$ git push origin :(sample)

リモートリポジトリで削除されたブランチが手元で残っているとき削除する  
$ git remote prune origin  

# start to use git

```
git config --global user.name (name)
git config --global user.email (email address)
git config --global color.ui auto
git config --global alias.ch checkout
git config --global alias.co commit
git config --global alias.st status
git config --global alias.br branch
git config --global core.quotepath off
git config --global core.editor vim
git config --global push.default simple
git config --global commit.verbose true
```

# connect bitbucket using name changed ssh key (not id_rsa)

prepare ssh key (ex. deploykey_rsa)  
register ssh public key to bitbucket account or repository  

on server  

$ vi .ssh/config

```
Host bitbucket
  HostName bitbucket.org
  User git
  IdentityFile ~/.ssh/deploykey_rsa
```

confirm  

$ ssh bitbucket  

link .ssh/config to git  

$ vim .gitconfig

```
[url "bitbucket:"]
    InsteadOf = git@bitbucket.org:
```

# use gpg

## on ubuntu

gpg is installed by default  
gpg2 is not installed by default  
gpg2 is gpg v2  

refer to: [GitHubでGPGにより署名されたcommitにバッジが表示されるようになったので設定してみる - Qiita](http://qiita.com/prince_0203/items/ef0e12f2f6d150ff0485)  

## create gpg key

$ gpg --gen-key  

follow the instruction  
wait for a long time  

$ gpg --list-keys  

```
pub   4096R/xxxxxxxx 2016-04-10
uid           sample foobar <sample@sample.com>
sub   4096R/yyyyyyyy 2016-04-10
```

xxxxxxxx is the id  

show public key  
$ gpg --armor --export コピーした鍵のID  

copy and paste in the github setting  

$ git config --global gpg.program gpg  
$ git config --global user.signingkey コピーした鍵のID  
$ git config --global commit.gpgsign true  

## copy gpg key

copy .gnupg directory  
-> this didn't work because git version was old  

# change gpg passphrase

$ gpg --edit-key (key id)  
> passwd  
> (input old passphrase and new passphrase)  

# revert one file to old commit

$ git checkout [commit hash] [file path]  

# fix conflict

## 片方の変更だけ適用する

元のブランチを採用  
$ git checkout --ours file

マージするブランチを採用  
$ git checkout --theirs file

$ git add file  
$ git comit  

# useful

## コメントの変更を無視したdiff

http://tmtms.hatenablog.com/entry/2017/11/14/git-diff-ignore-comment  
