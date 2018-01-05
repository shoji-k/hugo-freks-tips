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

# install

[package-manager](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)  

```
sudo apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
```

npmもインストールされる  


# use docker

## npm install

$ docker run --rm -i -v $(pwd):/src mkenney/npm npm install  

## gulp

$ docker run --rm -i -v $(pwd):/src mkenney/npm gulp  

# yarn

## install

[Installation \| Yarn](https://yarnpkg.com/en/docs/install#linux-tab)
