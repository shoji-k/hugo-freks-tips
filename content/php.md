+++
title = "php"
draft = false
date = "2016-12-19T15:16:16+09:00"
categories = [ "engineer" ]
tags = [ "php" ]

+++

#### ワンライナーでphp.iniの場所を調べる

$ php -r "phpinfo();" | grep php.ini

#### DateTime

昨日、明日、来月を表示

```
$yesterday = (new DateTime())->sub(new DateInterval('P1D'))->setTime(0,0,0);
echo $yesterday->format('Y-m-d H:i:s'), PHP_EOL;
$tomorrow = (new DateTime())->add(new DateInterval('P1D'))->setTime(0,0,0);
echo $tomorrow->format('Y-m-d H:i:s'), PHP_EOL;
$nextMonth = (new DateTime())->add(new DateInterval('P1M'))->setTime(0,0,0);
echo $nextMonth->format('Y-m-d H:i:s');
```
