+++
title = "apache"
draft = false
date = "2016-12-26T19:23:04+09:00"
categories = [ "engineer" ]
tags = [ "apache" ]

+++

#### confの文法チェック

$ apachectl configtest

#### サブディレクトリへのアクセスログを分ける

```
SetEnvIf Request_URI "/sample/" sample
CustomLog "logs/access_log" combined env=!sample
CustomLog "logs/sample-access_log" combined env=print
```

