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
```

キャッシュを削除する

cssを含むリンクのみ

```
grep -lr "css" /var/cache/nginx/ | xargs rm -f
```

特定のリンク

```
grep -lr "http://sample.com/" /var/cache/nginx/ | xargs rm -f
```

#### basic認証

htpasswdでパスワードファイルを作る

##### centos7

htpasswdをインストール

```
$ sudo yum install httpd-tools
```

$ sudo htpasswd -c /etc/nginx/.htpasswd username  
$ sudo vim /etc/nginx/conf.d/default.conf

```
auth_basic "好きなrealmを";
auth_basic_ user_file /etc/nginx/.htpasswd;
```

#### リバースプロキシ

ip_hashでクライアントIPアドレスを元にセッションが維持される  

```
upstream backend {
  ip_hash;
  server 127.0.0.1:80;
  server 127.0.0.1:81 ;
}

# sample
location ~* \.php$ {
  proxy_pass http://backend;
}
```




