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


