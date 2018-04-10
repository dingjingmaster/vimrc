":PluginInstall
hi clear
syntax off
syntax reset
syntax on
set runtimepath+=~/.vim_runtime
set rtp+=~/.vim/bundle/Vundle.vim/
source ~/.vim/my_configs.vim
let g:go_version_warning = 0 " 去除版本信息警告


set nocompatible
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'a.vim'
Plugin 'EasyGrep'  
Plugin 'taglist.vim'
Plugin 'fatih/vim-go'
Plugin 'szw/vim-tags'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-git'
Plugin 'fs111/pydoc.vim'
Plugin 'tomtom/tlib_vim'  
Plugin 'tomtom/viki_vim' 
Plugin 'othree/html5.vim'
Plugin 'mattn/webapi-vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'spacevim/spacevim'
Plugin 'majutsushi/tagbar'
Plugin 'wincent/command-t'
Plugin 'junegunn/vim-emoji'
Plugin 'justinmk/vim-sneak'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'wellle/targets.vim'
Plugin 'jsit/vim-customcpt'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-classpath'
Plugin 'robcsi/viewmaps.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'scrooloose/nerdtree'  
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/deoplete.nvim'
Plugin 'apalmer1377/factorus'
Plugin 'stanangeloff/php.vim'
Plugin 'shaneharper/vim-rtags'
Plugin 'derekwyatt/vim-scala'
Plugin 'flazz/vim-colorschemes'
Plugin 'valloric/youcompleteme'
Plugin 'sashang/vim-chroot-build'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'Lokaltog/vim-powerline.git'  
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dawikur/algorithm-mnemonics.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
nnoremap <C-c> :call multiple_cursors#quit()<CR>
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
filetype plugin indent on

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
colorscheme onedark

" ctag
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

" multiple-cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<F6>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_quit_key='<C-c>'


"-----NERDTree-----  
let g:NERDTreeCaseSensitiveSort = 1  
let g:NERDTreeWinSize = 25  
let g:NERDTreeWinPos = "right"  
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>   
nnoremap <silent> <Leader>o :NERDTreeFind<CR> 

" -- powerline --
set fillchars+=stl:\ ,stlnc:\  
let g:Powerline_symbols = 'compatible'  
let g:Powerline_stl_path_style = 'filename'  "只显示文件名  

"-----Command-T-----  
let g:CommandTFileScanner = 'ruby'   "使用ruby作为文件浏览器  
let g:CommandTTraverseSCM = 'dir'    "根目录为执行vim时所在的目录    
"打开文件跳转  
nnoremap <silent> <Leader>f :CommandT<CR> 

" -- taglist --
let Tlist_Show_One_File = 1           "只显示当前文件的taglist  
let Tlist_Exit_OnlyWindow = 1         "taglist是最后一个窗口时退出vim  
let Tlist_Use_Left_Window = 1         "在左侧窗口显示taglist  
let Tlist_GainFocus_On_ToggleOpen = 1 "打开taglist时，光标停在taglist窗口  
let Tlist_Auto_Update = 1             "自动更新  
" 打开标签浏览器  
nnoremap <silent><Leader>dt :Tlist<CR>  
" 重新生成标签   
nnoremap <silent><Leader>bt :!~/Myfiles/Tool/sh/ctags/hitags.sh<CR>  
" 高亮标签  
nnoremap <silent><Leader>ht :so tags.vim<CR> 
" 打开标签浏览器  
nnoremap <silent><Leader>dt :Tlist<CR>  
" 重新生成标签   
nnoremap <silent><Leader>bt :!~/Myfiles/Tool/sh/ctags/hitags.sh<CR>  
" 高亮标签  
nnoremap <silent><Leader>ht :so tags.vim<CR>  

"-----cscope-----  
"加载cscope库  
if filereadable("cscope.out")  
    cs add cscope.out  
endif  
set cscopequickfix=s-,c-,d-,i-,t-,e- "使用quickfix窗口显示结果  
set cst                              "跳转时也使用cscope库  
"打开引用窗口  
nnoremap <silent><Leader>cw :cw<CR>  
"重新生成索引文件  
nnoremap <silent><Leader>bc :!cscope -Rbq<CR>  
"s: 查找本C符号  
"g: 查找本定义  
"d: 查找本函数调用的函数  
"c: 查找调用本函数的函数  
"t: 查找本字符串  
"e: 查找本egrep模式  
"f: 查找本文件  
"i: 查找包含本文件的文件  
nnoremap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>  
nnoremap <C-\>i :scs find i <C-R>=expand("<cfile>")<CR><CR>  
nnoremap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>  

"-----YouCompleteMe-----  
let g:ycm_server_python_interpreter= '/usr/bin/python2'  
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"默认配置文件  
let g:ycm_key_invoke_completion = '<C-Tab>'         "跨文件补全  
let g:ycm_confirm_extra_conf = 0
"关闭加载配置文件提示  
let g:ycm_cache_omnifunc = 0                        "关闭补全缓存  
let g:ycm_enable_diagnostic_signs = 0               "关闭诊断提示符  
let g:ycm_enable_diagnostic_highlighting = 1        "关闭诊断高亮  
let g:ycm_show_diagnostics_ui = 0                   "关闭诊断ui  
let g:ycm_min_num_of_chars_for_completion = 3
"n字符开始自动补全  
"获取变量类型  
nnoremap <silent><Leader>yt :YcmCompleter GetType<CR>  
"跳转定义或声明  
nnoremap <silent><Leader>yg :YcmCompleter GoTo<CR>  
"跳转包含文件  
nnoremap <silent><Leader>yi :YcmCompleter GoToInclude<CR>  
"打开诊断信息  
nnoremap <silent><Leader>yd :YcmDiags<CR>  

"-----EasyGrep-----  
let EasyGrepMode = 2        "根据文件类型搜索相应文件  
let EasyGrepRecursive = 1   "递归搜索  
let EasyGrepCommand = 1     "使用grep  
let EasyGrepJumpToMatch = 0 "不要跳转



