+++
title = "awscli"
draft = true
date = "2017-05-11T15:18:08+09:00"

+++

## 初期設定

AWS IAM Managerでアカウントを用意、Access keyを作成する  
作ったアカウントに権限を与える  
groupでAdministratorAccessを与えると全部できそう  

$ aws configure

## ELBに登録されたSSL証明書一覧を表示する

$ aws iam list-server-certificates

## ELBに登録されたSSL証明書を削除する

$ aws iam delete-server-certificate --server-certificate-name (証明書の名前）

## SSL証明書アップロード

管理画面GUIからだとエラーになる

$ aws iam upload-server-certificate --server-certificate-name your-certificate-name --certificate-body file://Certificate.pem --certificate-chain file://CertificateChain.pem --private-key file://PrivateKey.pem

[サーバー証明書の使用 \- AWS Identity and Access Management](http://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/id_credentials_server-certs.html)

EC2 > ELBの設定で、アップロードしたSSL証明書を選べば反映させる
