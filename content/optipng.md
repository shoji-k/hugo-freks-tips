+++
title = "optipng"
draft = false
date = "2017-02-18T14:33:16+09:00"
categories = [ "engineer" ]
tags = [ "optipng" ]

+++

optimize png file

## install

### centos7

$ sudo yum install optipng

## how to use

$ optipng -o7 sample.png

-o7 level7(max)  

with backup

$ optipng -o7 -keep sample.png

then create sample.png.bak too

bulk compress

$ find . -iname *.png -type f | xargs optipng -o7
