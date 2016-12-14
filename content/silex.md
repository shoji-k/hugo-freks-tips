+++
title = "silex"
draft = false
date = "2016-12-14T13:54:42+09:00"
categories = [ "engineer" ]
tags = [ "php", "silex" ]

+++

### starter

see [Usage \- Documentation \- Silex \- The PHP micro\-framework based on the Symfony Components](http://silex.sensiolabs.org/doc/master/usage.html)

$ composer require silex/silex:~2.0

サンプルコードを用意  
$ mkdir src  
$ cd src  
$ vim index.php

```
<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

$app->get('/hello/{name}', function ($name) use ($app) {
    return 'Hello '.$app->escape($name);
});

$app->run();
```

起動して確認する  
$ cd ..  
$ php -S localhost:8080 -t src  
access http://localhost:8080/hello/taro  

