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

## var_dump(); exit; 的な

raise foobar.inspect

# migration

## カラムを追加する

Userテーブルにcontent:stringのカラムを追加する  
$ rails generate migration AddColumnToUser content:string

## 作ったmigrationを削除する

$ rails destroy migration (class name)

## migrationを適用する

$ rails db:migrate

# rails command

controllerのgenerateとdestroy

```
$ rails generate controller StaticPages home help
$ rails destroy  controller StaticPages home help
```

modelのgenerateとdestroy

```
$ rails generate model User name:string email:string
$ rails destroy model User
```

database migrate

```
$ rails db:migrate
$ rails db:rollback
```

database reset  
DBをdropしてmigrateする  
db:reset は drop して db schema を使って作る  

```
$ rails db:migrate:reset
```

db seed  
db/seed.rbを動かす

```
$ rails db:seed
```

# dbを変更しないrails console

```
rails console --sandbox
```

# production用コマンド

```
rails server --environment production
rails db:migrate RAILS_ENV=production
```

# byebug gem

debuggerをコード内に挿入  
rails s の場所でデバッグができる  
Ctrl + D で抜ける  

