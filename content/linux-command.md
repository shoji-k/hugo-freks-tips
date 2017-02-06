+++
title = "linux command"
draft = false
date = "2017-01-20T13:06:40+09:00"
categories = [ "engineer" ]
tags = [ "linux", "command" ]

+++

#### delete 0 byte file

$ find . -maxdepth 1 -size 0 -print | xargs rm

#### さっきいたディレクトリに戻る

$ cd -

#### 文字化けしたファイル名を修正する

find . -maxdepth 1 -type f | xargs convmv -f sjis -t utf8
