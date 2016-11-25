+++
title = "cakephp"
draft = false
date = "2016-11-25T16:54:03+09:00"
categories = [ "engineer" ]
tags = [ "php", "cakephp" ]

+++

モデルのデータベースアクセスをSQLで確認する

```
$data = $this->SampleModel->find('all);
$sqlLog = $this->SampleModel->getDataSource()->getLog(false, false);
debug($sqlLog);
```
