+++
date = "2018-05-24T21:21:16+09:00"
draft = false
title = "xdebug"
categories = [ "engineer" ]
tags = [ "php" ]

+++

# setting

$ vim /etc/php.d/20-xdebug.ini

読込

```
zend_extension=xdebug.so
```

常に出力

```
xdebug.profiler_enable = 1
```

XDEBUG_PROFILEクエリストリングを付けたときだけ出力

```
xdebug.profiler_enable_trigger = 1
xdebug.profiler_output_dir = /tmp/ # writable directory
```

sample.com/?XDEBUG_PROFILE にアクセスで  
でProfilingファイルが出力される  

