+++
title = "hugo"
draft = false
date = "2016-11-21T10:49:54+09:00"
categories = [ "engineer" ]
tags = [ "hugo" ]

+++

# start hugo

最新リリースをダウンロード  
[Releases · spf13/hugo](https://github.com/spf13/hugo/releases)

$ wget https://github.com/spf13/hugo/releases/download/v0.17/hugo_0.17-64bit.deb

インストール  
$ dpkg -i hugo_0.17-64bit.deb

コマンド確認  
$ hugo version

```
Hugo Static Site Generator v0.17 BuildDate: 2016-10-07T23:46:29+09:00
```

bookshelfディレクトリを作ってに初期化  
$ hugo new site bookshelf

サーバーを起動、ドラフトも表示させる  
$ hugo server --buildDrafts

テーマがないと表示されない

テーマをインストール
$ cd themes

.gitignoreにthemesを設定する場合  
$ git clone git@github.com:dim0627/hugo_theme_robust.git robust

or

$ git submodule add git@github.com:dim0627/hugo_theme_robust.git robust

投稿を追加  
$ hugo new post/good-to-great.md

サーバーを起動、テーマ指定、ドラフトも表示させる  
$ hugo server --theme=robust --buildDrafts

テーマは簡単に切り替えられる  
サーバーはライブリロードも効く

設定を変える  
$ vim config.toml

undraftする  
$ hugo undraft content/post/good-to-great.md

publicディレクトリにアウトプット  
$ hugo --theme=robust

## tableタグにclassを追加する

hugo-robust-themeの場合  
$ vim layouts/_default/summary.html

before  

```
<div class="article-body">{{ .Content }}</div>
```

after  

```
<div class="article-body">{{ replace .Content "<table>" "<table class='table'>" | markdownify }}</div>
```

see [Support for Kramdown/Maruku attribute lists in markdown files · Issue \#1585 · spf13/hugo](https://github.com/spf13/hugo/issues/1585)

## baseUrlにサブディレクトリを使う

サブディレクトリがあると、ページャーのリンクがうまく動かない  
e.g. 次へをクリックするとlocalhost/sub/pages/2へ遷移せず、localhost/pages/2へ遷移する  

$ vim config.toml

```
relativeURLS = true
canonifyurls = true
```

を追加で解決

## paginationの数を変える

$ vim config.toml

```
paginate = 100
```

[Hugo \- Pagination](https://gohugo.io/extras/pagination/)

# テーマの一部を上書きする

themesディレクトリにテーマがあり、同じ構成のディレクトリ、ファイルを用意すると上書きされる  
li.htmlを上書きするなら  
$ cp themes/hugo_theme_robust/layouts/_default/li.html layouts/_default/li.html  
で編集する  

