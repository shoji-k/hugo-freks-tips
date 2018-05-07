+++
date = "2017-05-22T15:38:01+09:00"
draft = false
title = "nodejs"
categories = [ "engineer" ]
tags = [ "node" ]

+++

# version

偶数番号が安定バージョン e.g. Node v.6.x.x  
奇数番号はサポートが短い e.g. Node v.7.x.x   

# install node

[package-manager](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)  

```
sudo apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
```

npmもインストールされる  

# install node, use nvm

[creationix/nvm: Node Version Manager \- Simple bash script to manage multiple active node\.js versions](https://github.com/creationix/nvm)

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install node # stable version
nvm use node # use stable version
```

# version up npm

$ npm install -g npm

# check global directory and modules

$ npm list -g

# use docker

## npm install

$ docker run --rm -i -v $(pwd):/src mkenney/npm npm install  

## gulp

$ docker run --rm -i -v $(pwd):/src mkenney/npm gulp  

# yarn

## install

[Installation \| Yarn](https://yarnpkg.com/en/docs/install#linux-tab)
