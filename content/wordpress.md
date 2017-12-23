+++
date = "2017-10-23T20:42:25+09:00"
draft = false
title = "wordpress"
categories = [ "engineer" ]
tags = [ "wordpress" ]

+++

# plugin info

https://wordpress.org/plugins/developers/  
readme.txt and readme validate link in the link above  

## guidelines

https://developer.wordpress.org/plugins/wordpress-org/detailed-plugin-guidelines/  

## plugin header

see other plugins or guidelines  

## to check

- PHP CodeSniffer

# wp cli

## install

https://make.wordpress.org/cli/handbook/installing/  
or  
use 

# phpunit install

php 5.7  
$ docker run --rm -v $(pwd):/app composer require --dev phpunit/phpunit ^5.7

php 7  
$ docker run --rm -v $(pwd):/app composer require --dev phpunit/phpunit ^6.2

## scaffold plugin

$ wp scaffold plugin --allow-root (plugin name)  

### test db for a plugin

implement script on a database server.  

this needs curl (or wget), subversion, mysqladmin  
apt intall curl subversion mysql-client  

mv created plugin directory  

$ bash ./bin/install-wp-tests.sh (database name) (user id) (user password) (server host) latest false  
lastest = wordpress version  
last boolean = skip database creation  

$ bash ./bin/install-wp-tests.sh wordpress_test root password db_host  

# run test

mv created plugin directory  

if you installed phpunit globally,  
$ phpunit  

if you installed phpunit localy,  
$ ../../../vendor/bin/phpunit  

if you failed, remove /tmp/*  

test reference  
- [PHPUnit – Make WordPress Core](https://make.wordpress.org/core/handbook/testing/automated-testing/phpunit/)
- [Automated Testing in WordPress, Really?\!](https://www.slideshare.net/ptahdunbar/automated-testing-in-wordpress-really)
- [Introduction To WordPress Unit Testing \| Tom McFarlin](https://tommcfarlin.com/wordpress-unit-testing/)
- [unit testing \| WordPress\.tv](https://wordpress.tv/tag/unit-testing/)
