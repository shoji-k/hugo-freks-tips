+++
title = "fuelphp"
draft = false
date = "2017-04-11T15:21:18+09:00"
categories = [ "engineer" ]
tags = [ "php", "fuelphp" ]

+++

# install
[Instruction \- Installation \- FuelPHP Documentation](https://fuelphp.com/docs/installation/instructions.html)

/usr/local/bin/oil にインストールされる

oilコマンドはfuelphpプロジェクト以外の場所でたたくとエラーを吐く  
e.g. This is not a valid Fuel installation so Oil is a bit lost.  

$ oil create <project_name>  
でプロジェクトが作れる  
実際は git clone して composer install をしている  

cd <project_name>  
oil server  
で起動できる

## config

### 環境切り替え

FUEL_ENVの環境変数によって読みこむconfigファイルが切り替わる  
bootstrap.phpにコード有り  

$ FUEL_ENV=production oil server

もしくはapacheの設定に渡す

### profilingをdevelopmentで有効にする

app/config/config.phpに profiling のパラメータがあるがこれは全体に影響する  
app/config/development/config.phpを作るとパラメーターが上書きされる

$ vim app/config/development/config.php

```
return array(
    'profiling'  => true,
);
```

データベースのプロファイルも表示するなら

$ vim app/config/development/db.php

```
return array(
  'default' => array(
      'connection'  => array(
      'dsn'        => 'mysql:host=localhost;dbname=fuelphp',
      'username'   => 'root',
      'password'   => 'root',
      ),
+    'profiling'  => true,
  ),
);

```

### オリジナルのパラメータを追加する

app/configディレクトリに新しくファイルを作って読み込む  

$ vim app/config/original.php

```
return [
    'one' => 'sample'
];
```

読み込むには

```
Config::load('original', true);
$one = Config::get('original.one');
```

