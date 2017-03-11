+++
title = "amazon ecs"
draft = true
date = "2017-03-10T14:29:18+09:00"
categories = [ "engineer" ]
tags = [ "aws", "ecs" ]

+++

see [Amazon EC2 Container Service とは](http://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/Welcome.html)

# クラスター

一番大枠  
中に立ち上げるEC2インスタンスの数を決められる  

# コンテナインスタンス

EC2インスタンス  
dockerとecs agent入りの[AMI](http://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/ecs-optimized_AMI.html?shortFooter=true)を使う  

EC2を自分で用意してクラスターに参加させることもできる  

# タスク定義

Docker imageの指定  
CPU、メモリの指定  

複数のコンテナを指定できる  

<blockquote>
同じインスタンスでどのプロセスを一緒に実行する必要があるか、各コンポーネントをどのようにスケーリングするかを検討します
</blockquote>
<small>http://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/application_architecture.html</small>

# サービス

<blockquote>
タスク定義の指定した数 ("必要数") のインスタンスを ECS クラスターで同時に実行して維持できます。
</blockquote>
<small>
http://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/ecs_services.html?shortFooter=true</small>

- タスクが停止したらタスクを強制終了、再度開始する
- ロードバランサーの指定
