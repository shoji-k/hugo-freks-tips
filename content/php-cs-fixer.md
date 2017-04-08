+++
draft = true
date = "2017-04-07T16:54:27+09:00"
title = "php cs fixer"

+++

[PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)

# install by composer

$ composer global require friendsofphp/php-cs-fixer

# how to use

標準設定ファイル  
個別の設定は .php_cs

$ vim .php_cs.dist

```
<?php
namespace PhpCsFixer;

return Config::create()
  ->setRiskyAllowed(true)
  ->setRules([
    '@PSR1' => true,
    '@PSR2' => true,
    '@Symfony' => true,
    '@Symfony:risky' => true,
    'array_syntax' => [
      'syntax' => 'short',
    ],
  ])
;
```

確認 .php_cs.dist を使う

$ php-cs-fixer fix --dry-run --diff

修正 .php_cs.dist を使う

$ php-cs-fixer fix
