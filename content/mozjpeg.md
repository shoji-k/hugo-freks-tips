+++
date = "2018-05-10T16:58:02+09:00"
draft = false
title = "mozjpeg"
categories = [ "engineer" ]
tags = [ "jpeg" ]

+++


[mozilla/mozjpeg: Improved JPEG encoder\.](https://github.com/mozilla/mozjpeg/)

# install on ubuntu 16.04

$ sudo apt-get install autoconf automake libtool nasm make pkg-config

$ git clone git@github.com:mozilla/mozjpeg.git
$ cd mozjpeg
$ autoreconf -fiv
$ ./configure
$ make
$ sudo make install

```
./configure: line 13812: syntax error near unexpected token `libpng,'
```

とか出たときは、pkg-configを入れてなくてエラーが起きた  
再度、autoreconfからやり直してうまくいった  

installed in /opt/mozjpeg/bin

$ ln -s /opt/mozjpeg/bin/* /usr/local/bin

$ jpegtran file.jpg > out/file.jpg

sample shell

```
#!/bin/sh

OUTDIR="./out"
FILES=`find . -maxdepth 1 -type f -iname '*.jpg'`
echo $FILES

echo `pwd`

mkdir -p $OUTDIR
for file in $FILES; do
  echo $file
  OUTFILE="$OUTDIR/$file"
  jpegtran -optimize -progressive -copy none "$file" > "$OUTFILE"
  #jpegtran -arithmetic -progressive -arithmetic -copy all "$file" > "$OUTFILE"
done

echo 'done'
```
