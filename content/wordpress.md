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

## scaffold plugin

$ wp scaffold plugin --allow-root (plugin name)  

# phpunit install

php 5.7  
$ docker run --rm -v $(pwd):/app composer require --dev phpunit/phpunit ^5.7

php 7  
$ docker run --rm -v $(pwd):/app composer require --dev phpunit/phpunit ^6.2

