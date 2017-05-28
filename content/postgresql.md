+++
date = "2017-05-17T14:09:38+09:00"
draft = false
title = "postgresql"
categories = [ "engineer" ]
tags = [ "postgres" ]

+++

# scheme

スキーマを分けると権限のあるユーザーしか参照できない  

# command

\l データベース一覧  
\c database databaseに接続  
\dt テーブル一覧  
\d table table仕様を表示  

# backup

$ pg_dump -H hostname -d databasename -U user > backup.sql  

# restore

$ psql -U user database < backup.sql  

# sequence作成

```
CREATE SEQUENCE sample
START WITH 26
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;
```
# sequenceのidをセット

id=5までは登録済みとする  
次からは6

```
SELECT pg_catalog.setval('sample', 5, true);
```
