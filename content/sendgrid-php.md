+++
title = "sendgrid php"
draft = false
date = "2017-03-12T14:10:31+09:00"
categories = [ "engineer" ]
tags = [ "sendgrid", "php" ]

+++

refference: https://github.com/sendgrid/sendgrid-php

# install

$ composer install sendgrid/sendgrid

# set api key

```
echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
echo "sendgrid.env" >> .gitignore
source ./sendgrid.env
```

# sample code

see: https://github.com/sendgrid/sendgrid-php/blob/master/examples/contactdb/contactdb.php

```
<?php
require 'vendor/autoload.php';

$apiKey = getenv('SENDGRID_API_KEY');
$sg = new \SendGrid($apiKey);

$response = $sg->client->contactdb()->lists()->get();
echo 'status code: ', $response->statusCode(), PHP_EOL;
echo '======body======',PHP_EOL;
var_dump($response->body());
echo '======headers======',PHP_EOL;
var_dump($response->headers());
```
