+++
date = "2017-10-23T19:21:24+09:00"
draft = true
title = "php codesniffer"

+++

# install

$ docker run --rm -v $(pwd):/app composer require "squizlabs/php_codesniffer=*"

# wordpress

Wordpress設定ダウンロード  
$ git clone git@github.com:WordPress-Coding-Standards/WordPress-Coding-Standards.git ./vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress  
$ ./vendor/bin/phpcs --config-set installed_paths /var/www/html/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress/  

確認  
$ ./vendor/bin/phpcs -i  
The installed coding standards are Squiz, PSR1, PSR2, PEAR, Zend, MySource, WordPress, WordPress-Core, WordPress-Extra, WordPress-VIP and WordPress-Docs  

チェック  
$ ./vendor/bin/phpcs -p -s -v --standards=Wordpress  

