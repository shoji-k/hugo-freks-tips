+++
draft = false
title = "eccube3"
date = "2017-01-16T16:34:30+09:00"
categories = [ "engineer" ]
tags = [ "php", "eccube3" ]

+++

# reference

[EC\-CUBE プラグインチュートリアル \| EC\-CUBE 開発ドキュメント](http://doc.ec-cube.net/plugin_tutorial)  
[Symfony2 ドキュメントポータル](http://docs.symfony.gr.jp/)  
[Welcome to Doctrine 2 ORM’s documentation\! — Doctrine 2 ORM 2 documentation](http://docs.doctrine-project.org/projects/doctrine-orm/en/latest/)  

# debug mode

デバッグモード用のURLが用意されている  
index_dev.phpを入れるとデバッグモード  
http://localhost/index_dev.php/sample/aaa

# plugin

Customizeプラグインを作る場合

generate command  
$ php app/console plugin:develop generate

```
Customize/
├── config.yml
├── Controller
│   ├── ConfigController.php
│   └── CustomizeController.php
├── event.yml
├── Form
│   └── Type
│       └── CustomizeConfigType.php
├── CustomizeEvent.php
├── LICENSE
├── PluginManager.php
├── Resource
│   └── template
│       ├── admin
│       │   └── config.twig
│       └── index.twig
└── ServiceProvider
    └── CustomizeServiceProvider.php
```

- config.yml  

プラグインの定義、ServiceProviderやEventの登録

- ServiceProviderディレクトリ

メインロジック、ルーティングの設定やFormのセットなど

- event.yml

フックポイントとEvent methodをつなげる

- CustomizeEvent.php

config.ymlにevent.ymlとつながるクラス名をセット  
event.ymlとつなぐmethodを用意  

- Controllerディレクトリ

コントローラーを設置  

# clear cache

キャッシュファイル削除  
$ php app/console cache:clear

セッション情報も含めて削除  
$ php app/console cache:clear --all

# plugin cli

$ php app/console plugin:develop install --code CategoryContent  
$ php app/console plugin:develop enable --code CategoryContent  

# doctrine

Resource/doctrine/xxxx  
を変更したら  

check--

```
./vendor/bin/doctrine orm:schema-tool:update --dump-sql
```

update  

```
./vendor/bin/doctrine orm:schema-tool:update --force
```

# log

see [ログ出力設定 \| EC\-CUBE 開発ドキュメント](http://ec-cube.github.io/guideline_log)

# Formにエラーを表示する

```
$form->get('form_item')->addError(new FormError('error message'));
```

