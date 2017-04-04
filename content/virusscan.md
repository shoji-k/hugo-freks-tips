+++
title = "virusscan"
draft = false
date = "2017-04-04T12:41:55+09:00"
categories = [ "engineer" ]
tags = [ "virus" ]

+++

# clamav

## install on ubuntu

$ sudo apt-get install clamav

## refresh database

$ sudo freshscan

## search virus

カレントディレクトリ内の汚染されたファイルを表示する  
$ clamscan --infected -r ./


