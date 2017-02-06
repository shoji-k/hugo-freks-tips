+++
title = "nginx"
draft = false
date = "2017-02-05T10:43:20+09:00"
categories = [ "engineer" ]
tags = [ "nginx" ]

+++

#### config test

centos 7  
$ sudo nginx -t  

#### initial

$ vim /etc/nginx/conf.d/default.conf

- add server_tokens: off to html {}

#### プロキシ設定

$ vim /etc/nginx/conf.d/default.conf

```
upstream backend {
    server 127.0.0.1:8080;
}

server {
    listen       80;
    server_name  localhost;

    root /home/user/ws/docker/jitan/src/html;
    index index.php index.html index.htm;

    #error_page  404              /404.html;
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;

    location / {
        try_files $uri @app;
    }

    location ~* \.php$ {
        proxy_pass http://backend;
    }

    location @app {
        proxy_pass http://backend;
    }

    location ~ /\.ht {
        deny  all;
    }
}
```

#### キャッシュプロキシ

```
http {
    proxy_cache_path /var/cache/nginx/cache levels=1:2 keys_zone=cachezone:60m max_size=1G inactive=7d;

    location ~* \.(html|css|jpg|gif|ico|js)$ {
        expires 1d;
        proxy_cache cachezone;
        proxy_cache_key $host$uri$is_args$args;
        proxy_cache_valid 200 301 302 1d;
        proxy_pass http://backend;
    }
}
'''
