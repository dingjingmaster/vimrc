syntax on
retab																															" 以前的tab也用4空格代替
set nu
set expandtab	        " 空格替换tab
set tabstop=4	        " 4空格替换一个tab
set cindent
set shiftwidth=4	    " 自动缩进4
set ruler
set magic
set showmatch
set hlsearch
set cursorline
set cursorcolumn
set autoread
set autowrite
set laststatus=2
set guifont=Courier_New:h10:cANSI
set noswapfile
set ignorecase
set autoindent
set cindent

autocmd InsertEnter * se cul 
"highlight CursorLine term=reverse,underline cterm=bold,underline ctermfg=4 ctermbg=236 gui=underline guifg=blue guibg=#ffff60
"highlight CursorColumn term=reverse cterm=bold ctermfg=4 ctermbg=236 guifg=blue guibg=#ffff60

autocmd BufNewFile *.* exec ":call SetFileTitle()"

func SetFileTitle()
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1,"/*************************************************************************") 
        call append(line("."),      "> FileName: ".expand("%")) 
        call append(line(".")+1,    "> Author  : DingJing") 
        call append(line(".")+2,    "> Mail    : dingjing@live.cn") 
        call append(line(".")+3,    "> Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
endfunc 

autocmd BufNewFile * normal G
                                                                                                                                                                                "


