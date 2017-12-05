set nu
set ruler
set magic
syntax on
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set hlsearch
set backspace=2
set ts=1

autocmd InsertEnter * se cul 
highlight CursorLine cterm=none ctermbg=250 ctermfg=white guibg=None guifg=None
highlight CursorColumn cterm=none ctermbg=250 ctermfg=blue guibg=None guifg=None

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetFileTitle()"

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


