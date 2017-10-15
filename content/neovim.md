+++
title = "neovim"
draft = false
date = "2017-05-08T09:49:39+09:00"
categories = [ "engineer" ]
tags = [ "neovim", "vim" ]

+++

# install

[Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## ubuntu 16.04 xenial

stable repository installs nvim 1.7.x on 2017-05-08  
use unstable repo to install 2.1.x  

# check

:CheckHealth show the status of neovim  

## clipboard

### local

need to install xclip or xsel  
$ sudo apt install xsel  

### over ssh

?

## python2

$ sudo pip install neovim  

## python3

$ sudo pip3 install neovim

# dein.vim

[GitHub \- Shougo/dein\.vim: Dark powered Vim/Neovim plugin manager](https://github.com/Shougo/dein.vim)

設定  
$ nvim ~/.config/nvim/init.vim  

```
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/dein.vim'
let s:toml_dir = s:config_dir . '/dein'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
  if !isdirectory(s:toml_dir)
    execute '!mkdir -p' s:toml_dir
    execute '!touch ' . s:toml_dir . '/plugins.toml'
    execute '!touch ' . s:toml_dir . '/lazy.toml'
    execute '!touch ' . s:toml_dir . '/neovim.toml'
  endif
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  if has('nvim')
    call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
  endif

  call dein#end()
  call dein#save_state()
endif
```


プラグインインストール  
:call dein#install()  

プラグインアップデート  
:call dein#update()  

プラグイン用tomlの書き方  

on_i = 1 -> insert modeになったら読み込む  
on_cmd => ['xxx'] -> xxxを実行したら読み込む  
on_source = ['xxx.nvim'] -> xxx.nvimが読み込まれたら読み込む  

# denite

:UpdateRemotePlugins  
でdeniteが返ってくればOK

$ nvim ~/.config/dein/neovim.toml

```
[[plugins]]
repo = 'Shougo/denite.nvim'
if = 'has("nvim")'
hook_add = '''
nnoremap [unite] <Nop>
nmap , [denite]
nmap <silent> [denite]<C-t> :<C-u>Denite filetype<CR>
nmap <silent> [denite]<C-p> :<C-u>Denite file_rec<CR>
nmap <silent> [denite]<C-j> :<C-u>Denite line<CR>
nmap <silent> [denite]<C-g> :<C-u>Denite grep<CR>
nmap <silent> [denite]<C-]> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> [denite]<C-u> :<C-u>Denite file_mru<CR>
nmap <silent> [denite]<C-y> :<C-u>Denite neoyank<CR>
nmap <silent> [denite]<C-r> :<C-u>Denite -resume<CR>
nmap <silent> [denite]; :<C-u>Denite -resume -immediately -select=+1<CR>
nmap <silent> [denite]- :<C-u>Denite -resume -immediately -select=-1<CR>
nmap <silent> [denite]<C-d> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/.config/dein']}])<CR>
'''
```

e.g.  
ファイル一覧表示  
:Denite file_rec  

insert modeからnormal modeへ  
<C-o>  


