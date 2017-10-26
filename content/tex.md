+++
date = "2017-10-26T18:05:42+09:00"
draft = false
title = "tex"
categories = [ "engineer" ]
tags = [ "aws", "ecr" ]

+++

# install

see https://user.ecc.u-tokyo.ac.jp/users/user-15826/wiki/?TeX/Install  

不要なものをけす  
apt purge texlive*  

download install files  
cd library/install-tl-20171024/  
./install-tl  
( I を入力)  

パスを通す  
PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux  
export PATH  

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


