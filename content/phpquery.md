+++
date = "2017-11-13T11:19:51+09:00"
draft = false
title = "phpquery"
categories = [ "engineer" ]
tags = [ "php", "scraping" ]

+++

jQueryでDOMを取得するようにPHPで実行できる  

# download

しばらくメンテされてないが使える  
https://code.google.com/archive/p/phpquery/downloads  
phpQuery-0.9.5.386-onefile.zip  
をダウンロード  

# sample

```
<?php
$url = 'https://freks.jp/';
$html = file_get_contents($url);
$doc = phpQuery::newDocument($html);
echo $doc->find("meta[property='og:title']")->attr('content');
echo $doc->find("title")->text();
```

