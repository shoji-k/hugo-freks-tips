+++
title = "apache"
draft = false
date = "2016-12-26T19:23:04+09:00"
categories = [ "engineer" ]
tags = [ "apache" ]

+++

# mod_rewrite

サンプルコードは以下を省略  

```
RewriteEngine on
```

### phpの拡張子を隠す

```
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME}\.php -f
RewriteRule ^(.*)$ $1.php [L]
```

L2 ディレクトリでなくて  
L3 foobar.phpが存在していたら  

### ファイルもディレクトリも存在してなかったらindex.phpを通す

フレームワークであるパターン

```
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]
```

### htmlファイルがあったらそれを表示

https://sample.com/test  
で test.html が存在する  

```
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME}\.html -f
RewriteRule ^(.*)$ $1.html [L]
```


## useful links
- [mod\_rewrite \- Apache HTTP Server Version 2\.4](http://httpd.apache.org/docs/current/mod/mod_rewrite.html)
- [mod\_rewriteのパラメータチェック用](http://uenomemo.sakura.ne.jp/sample/rewrite/_modrewrite_test.html?REQUEST_URI=/sample/rewrite/hoge.php&REQUEST_FILENAME=/home/uenomemo/www/sample/rewrite/hoge.php&IS_SUBREQ=false&HTTPS=off&HTTP_USER_AGENT=&THE_REQUEST=GET%20/sample/rewrite/hoge.php%20HTTP/1.1&Mozilla/5.0%20(Windows%20NT%2010.0;%20Win64;%20x64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/62.0.3202.94%20Safari/537.36&HTTP_REFERER=https://www.google.co.jp/&HTTP_COOKIE=&HTTP_FORWARDED=&HTTP_HOST=uenomemo.sakura.ne.jp&HTTP_PROXY_CONNECTION=&HTTP_ACCEPT=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8&REMOTE_HOST=p603028-ipngn200504kyoto.kyoto.ocn.ne.jp&REMOTE_PORT=62352&REMOTE_USER=&REMOTE_IDENT=&REQUEST_METHOD=GET&SCRIPT_FILENAME=/home/uenomemo/www/sample/rewrite/hoge.php&PATH_INFO=&QUERY_STRING=&AUTH_TYPE=&DOCUMENT_ROOT=/home/uenomemo/www&SERVER_ADMIN=support@sakura.ad.jp&SERVER_NAME=uenomemo.sakura.ne.jp&SERVER_ADDR=112.78.112.33&SERVER_PORT=80&SERVER_PROTOCOL=HTTP/1.1&SERVER_SOFTWARE=Apache/2.4.29&TIME_MON=11&TIME_DAY=29&TIME_HOUR=17&TIME_MIN=33&TIME_SEC=20&TIME_WDAY=3&TIME=20171129173320&rewrite_src=hoge.php)


# confの文法チェック

$ apachectl configtest

# サブディレクトリへのアクセスログを分ける

```
SetEnvIf Request_URI "/sample/" sample
CustomLog "logs/access_log" combined env=!sample
CustomLog "logs/sample-access_log" combined env=print
```

