+++
date = "2017-10-26T18:05:42+09:00"
draft = false
title = "tex"
categories = [ "engineer" ]
tags = [ "tex" ]

+++

# install

see https://user.ecc.u-tokyo.ac.jp/users/user-15826/wiki/?TeX/Install  
see http://xartaky.hatenablog.jp/entry/2016-12-27-texlive-on-ubuntu  

不要なものをけす  
apt purge texlive*  

download install files  
cd library/install-tl-20171024/  
./install-tl --repository http://mirror.ctan.org/systems/texlive/tlnet/  
( I を入力)  

パスを通す  
PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux  
export PATH  

# update

$ sudo tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet  
$ sudo tlmgr update --self --all  

# packages

[パッケージについて](http://www.biwako.shiga-u.ac.jp/sensei/kumazawa/aboutsty.html)  

## search

https://ctan.org/  
or  
tlmgr search (package name)  

## install

tlmgr install (package name)

カスタムしたものはディレクトリ  
$HOME/.texmf/  
にいれたりする  

see https://tex.stackexchange.com/questions/96976/install-custom-cls-using-tex-live-in-local-directory  
see https://tex.stackexchange.com/questions/8357/how-to-have-local-package-override-default-package  

# texとは

texはdvi(device independent)ファイルを出力する  
dviファイルがソフトなどで読み込まれ表示される  

# latexmk

複数の変換を一気にできる  

dvi 経由で pdf を生成する  
$ latexmk -pdfdvi sample.tex  

pdflatex で pdf を生成する  
$ latexmk -pdf sample.tex  

