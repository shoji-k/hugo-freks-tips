+++
title = "tls/ssl"
draft = false
date = "2017-04-26T12:20:54+09:00"
categories = [ "engineer" ]
tags = [ "tls", "ssl" ]

+++

# TLS証明書の選定

[2017.3 Googleとシマンテックがもめている](http://www.excite.co.jp/News/it_g/20170326/Slashdot_17_03_26_064241.html)

シマンテック関連会社

- ジオトラスト
- ラピッドSSL

残るは

- グローバルサイン
- サイバートラスト

[証明書比較サイト serverkurabe](https://serverkurabe.com/ssl-matome/)

国内代理店で買うのが費用面とサポートでよさそう

- [ドメインキーパー](https://www.ssl.ph/)
- [データホテル](https://datahotel.jp/service/sslcoupon/)


証明書乗り換えで、新規契約分の期限が伸ばせてよさそう

[ドメインキーパー 証明書乗り換え](https://www.ssl.ph/merit/contents08.html)

[クラスメソッド ELBにSSL証明書割り当て](http://dev.classmethod.jp/cloud/aws/aws-beginner-elb-ssl/)

AWSでは

- プライベートキー
- パブリックキー証明書
- 証明書チェーン

を入力して登録できる

