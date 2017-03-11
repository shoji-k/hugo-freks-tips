+++
title = "letsencrypt"
draft = false
date = "2017-02-14T11:19:01+09:00"
categories = [ "engineer" ]
tags = [ "letsencrypt", "ssl" ]

+++

# centos7 + nginx

## prerequirement

boot nginx  

## install

```
$ sudo yum install certbot
```

## prepare nginx configure

open for well-known  
It is accecced by certbot  

```
server{
  location ^~ /.well-known/ {
    access_log           off;
    log_not_found        off;
    root                 /usr/share/nginx/html;
    autoindex            off;
    index                index.html;
    try_files            $uri $uri/ =404;
  }
}
```

## get certification

some certifications are prepared to /etc/letsencrypt/live/sample.com/  
$ sudo certbot certonly --webroot -w /usr/share/nginx/html -d sample.com  

prepare dhparam.pem  
$ sudo openssl dhparam -out /etc/ssl/dhparam.pem 2048  

## nginx configuration

```
server {
  listen ssl 443;
  server_name sample.com;

  ssl_certificate /etc/letsencrypt/live/sample.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/sample.com/privkey.pem;

  ssl_session_cache   shared:SSL:3m;
  ssl_buffer_size     8k;
  ssl_session_timeout 10m;

  ssl_dhparam /etc/ssl/dhparam.pem;

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-
AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-R
SA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:ECDHE-RSA-DES-CBC3-SHA:ECDHE-ECDSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA2
56:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
  ssl_prefer_server_ciphers on;

  # HTTPS のみでサービスを提供する場合にだけ設定
  add_header Strict-Transport-Security max-age=15768000;
}
```

$ sudo systemctl reload nginx.service


