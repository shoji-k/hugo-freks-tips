+++
title = "cakephp"
draft = false
date = "2016-11-25T16:54:03+09:00"
categories = [ "engineer" ]
tags = [ "php", "cakephp" ]

+++

# install

## generate code

docker run composer だとintlがないからインストールに失敗するため  
composer.pharをダウンロード  

$ php composer.phar create-project --prefer-dist cakephp/app cms  

## set up database

change host, database name, etc...  
$ vim config/app.php  

insert sql by hand.  

# rule

Entity: Article  
Table: ArticlesTable  
Class: ArticlesController  
View: Articles/index.ctp  

# bake

bin/cake bake all users  
or  
bin/cake bake model users  
bin/cake bake controller users  
bin/cake bake template users  

# tips

モデルのデータベースアクセスをSQLで確認する

```
$data = $this->SampleModel->find('all);
$sqlLog = $this->SampleModel->getDataSource()->getLog(false, false);
debug($sqlLog);
```

json返す型

```
public function getJson()
{
    $this->autoRender = false;
    if(!$this->request->is('ajax')) {
      throw new BadRequestException();
    }

    $result = 'NG';
    $data = $this->request->data;
    if (strlen(strlen($data['id']) !== 0) {
        // do something
        $result = 'OK';
    }
    echo json_encode(compact('result'));
}
```

csvダウンロード型  
これだと中身が多いとメモリを消費する  
中身が多い場合は小分けにファイル保存して、ファイルダウンロードする  

```
public function download($uid)
{
    $this->autoRender = false;
    $this->response->type('csv');

    $fileName = '1.csv';
    $this->response->download($fileName);

    $str = "sample, sample2";
    $str .= "1, 2";

    $str = mb_convert_encoding($str, 'SJIS-win', 'utf8');
    $this->response->body($str);
}
```

