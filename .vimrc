hi clear
syntax off
syntax reset
syntax on
set runtimepath+=~/.vim_runtime
set rtp+=~/.vim/bundle/Vundle.vim/
source ~/.vim/my_configs.vim

set nocompatible
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'a.vim'
Plugin 'taglist.vim'
Plugin 'szw/vim-tags'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-git'
Plugin 'fs111/pydoc.vim'
Plugin 'othree/html5.vim'
Plugin 'mattn/webapi-vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'spacevim/spacevim'
Plugin 'junegunn/vim-emoji'
Plugin 'majutsushi/tagbar'
Plugin 'justinmk/vim-sneak'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'wellle/targets.vim'
Plugin 'jsit/vim-customcpt'
Plugin 'kiddos/malokai.vim'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-classpath'
Plugin 'robcsi/viewmaps.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/deoplete.nvim'
Plugin 'apalmer1377/factorus'
Plugin 'shaneharper/vim-rtags'
Plugin 'flazz/vim-colorschemes'
Plugin 'valloric/youcompleteme'
Plugin 'sashang/vim-chroot-build'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dawikur/algorithm-mnemonics.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()

set background=dark
set foldenable
set foldmethod=manual
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
let g:sneak#label = 1
let g:deoplete#enable_at_startup = 1

" color
syntax enable
colorscheme molokai
"
"" ctag
set exrc
set secure
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_use_language_field = 1
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_ignore_file_comment_pattern = '^[#"]'
let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
let g:vim_tags_extension = '.tags'
let g:vim_tags_main_file = 'tags'
"
"" multiple-cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<F6>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
filetype plugin indent on



