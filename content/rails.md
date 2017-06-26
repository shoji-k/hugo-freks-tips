+++
date = "2017-06-19T17:30:40+09:00"
draft = false
title = "rails"
categories = [ "engineer" ]
tags = [ "rails" ]

+++

# use docker

base image: [library/ruby \- Docker Hub](https://hub.docker.com/_/ruby/)

gem入りのイメージを作る  

$ vim Gemfile

Gemfileを用意  
すでにアプリがある場合は、Gemfileを持ってくる  
ない場合は、railsだけでいいと思う  

$ vim Dockerfile

```
FROM ruby

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /myapp

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
```

$ docker build -t myruby .

myrubyイメージが作れらた

rails newしてみる

$ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app myruby rails new app

ローカルディレクトリにrailsのファイルが作成される

rails server起動  
$ docker run -p 3000:30000 -v "$PWD":/usr/src/app -w /usr/src/app myruby rails server -b 0.0.0.0 -p 3000

画面にアクセスできる  


