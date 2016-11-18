+++
title = "start_hugo"
draft = true
date = "2016-11-18T17:41:38+09:00"

+++


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

