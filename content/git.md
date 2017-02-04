+++
draft = false
title = "git"
date = "2017-02-04T18:40:36+09:00"
categories = [ "engineer" ]
tags = [ "git" ]

+++

#### start to use git

```
git config --global user.name (name)
git config --global user.email (email address)
git config --global color.ui auto
git config --global alias.ch checkout
git config --global alias.co commit
git config --global alias.st status
git config --global alias.br=branch
git config --global core.quotepath off
git config --global core.editor vim
git config --global push.default=simple
git config --global commit.verbose=true
```

#### connect bitbucket using name changed ssh key (not id_rsa)

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

