+++
date = "2017-07-05T18:39:35+09:00"
draft = false
title = "pandoc"
categories = [ "engineer" ]
tags = [ "pandoc" ]

+++

# use docker

[jagregory/pandoc \- Docker Hub](https://hub.docker.com/r/jagregory/pandoc/)を使った
Haskelのイメージにpandocがインストールされてる  

$ docker pull jagregory/pandoc

## markdown to html

$ docker run --rm -v `pwd`:/source jagregory/pandoc -f markdown -t html5 myfile.md -o myfile.html

## metadatablock

$ pandoc -D latex  
でテンプレートが表示される  

abstractなどを渡すには文章の先頭に---で囲んだyaml形式で書く  
standaloneモード(-s or --standalone)で吐き出したときのみ有効になる  
http://sky-y.github.io/site-pandoc-jp/users-guide/#yaml-metadata-block  

```
---
title:  'これはタイトルです: コロンを含んでいます'
author:
  - 著者1
  - 著者2
tags: [nothing, nothingness]
abstract: |
  これは概要です。

  2つの段落で構成されています。
...

# heyhey

fooobar

- list 1
- list 2
- list 3
- list 4
```

$ pandoc -f markdown -t html5 sample.md -s -o result.html  

```
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="generator" content="pandoc">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="author" content="著者1">
  <meta name="author" content="著者2">
  <title>これはタイトルです: コロンを含んでいます</title>
  <style type="text/css">code{white-space: pre;}</style>
  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>
  <![endif]-->
</head>
<body>
<header>
<h1 class="title">これはタイトルです: コロンを含んでいます</h1>
<p class="author">著者1</p>
<p class="author">著者2</p>
</header>
<h1 id="heyhey">heyhey</h1>
<p>fooobar</p>
<ul>
<li>list 1</li>
<li>list 2</li>
<li>list 3</li>
<li>list 4</li>
</ul>
</body>
</html>
```

### set variables

$ pandoc -f markdown -t html5 --variable abstract="I'm an abstract" sample.md -s -o result.html  

