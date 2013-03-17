"set nocp
"set et 
"set smarttab 
"set st=4
"set sw=4
"set ai
"set si
"set nu
set fileencodings=utf8,gbk,big5
nmap ;sh :1! vim.bash.sh<CR>
nmap ;new :1! vim.newlisp.sh<CR>
nmap ;date :.! mydate.sh<CR>
nmap ;l :.! vim.line.sh<CR>
nmap ;w :w<CR>
nmap ;st :set paste<CR>
map <F5> :w<CR>
imap <F5> <esc>:w<CR>a
map <F2> :wq<CR>
imap <F2> <esc>:wq<CR>
nmap ;q :q<CR>
nmap <space> i<space><esc>
nmap ;wq :wq<CR>
nmap ;nl :set filetype=newlisp<CR>
imap <C-n> <esc>
nmap <CR> o<ESC>x

"######### 统计光标下单词数量 begin ##########"
function! CountWord()
   let expl=system('countword.sh ' .  expand("<cword>") . "  " . expand("%:p"))
       echo expl 
endfunction
nmap cw :call CountWord()<CR>
"######### 统计光标下单词数量 end ##########"

" ######### VimWiki begin ######### "
" 打开语法高亮
syntax enable
syntax on
 
" 打开对文件类型插件的支持
filetype indent on
filetype plugin on
filetype plugin indent on
 
 
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
 
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0
 
let g:vimwiki_list = [{'path': '/home/jimila/Desktop/mywiki','path_html': '/home/jimila/Desktop/mywiki/html','auto_export': 1}]
" ######### VimWiki end ######### "

" ######### english begin ######### "
function! E2c()
   let expl=system('google_translate.py en zh-CN  ' . expand("<cword>"))
     windo if
             \ expand("%")=="diCt-tmp" |
             \ q!|endif
       25vsp diCt-tmp
          setlocal buftype=nofile bufhidden=hide noswapfile
          1s/^/\=expl/
          1
endfunction

function! Mydict()
   let expl=system('dic.sh -1 ' . expand("<cword>"))
     windo if
             \ expand("%")=="diCt-tmp" |
             \ q!|endif
       25vsp diCt-tmp
          setlocal buftype=nofile bufhidden=hide noswapfile
          1s/^/\=expl/
          1
endfunction

function! Myspeak()
   let expl=system('googlespeak.sh ' .  expand("<cword>"))
endfunction

function! C2e()
   let expl=system('google_translate.py  zh-CN en ' .  expand("<cword>"))
     windo if
             \ expand("%")=="diCt-tmp" |
             \ q!|endif
       25vsp diCt-tmp
         setlocal buftype=nofile bufhidden=hide noswapfile
     1s/^/\=expl/
	   1
endfunction

nmap ;; :call Mydict()<CR>
vmap ;; :call Mydict()<CR>

nmap ;s :call Myspeak()<CR>
vmap ;s :call Myspeak()<CR>

nmap ;c :call E2c()<CR>
vmap ;c :call E2c()<CR>

nmap ;e :call C2e()<CR>
vmap ;e :call C2e()<CR>

" ######### english end ######### "

" ######### git begin ######### "

set nocompatible               " 设置 vim 为不兼容 vi 模式
filetype off                   " required

set rtp+=~/.vim/bundle/vundle/
" 如果在windows下使用，设置为
" set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'    

" My Bundles here:
"
" original repos on github
" 代码在 github 上, 使用 github 帐号/项目名
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" vim-scripts repos
" 代码在 vim script 上，使用插件名称，插件名字可以在 http://vim-scripts.org/vim/scripts.html 页面中查找

Bundle 'vimwiki'
Bundle 'bufexplorer.zip'
Bundle 'matrix.vim--Yang'
Bundle 'FencView.vim'
Bundle 'calendar-vim'
Bundle 'Conque-Shell'
Bundle 'Vimpress'
Bundle 'Markdown'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'Lokaltog/vim-easymotion' 
Bundle 'DrawIt'
"Bundle 'MRU'
Bundle 'TxtBrowser'
Bundle 'mru.vim'
"Bundle 'ManPageView'
" non github reposo
" 非github的插件，使用其git地址
" Bundle 'git://git.wincent.com/command-t.git'


filetype plugin indent on    " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"
"
"
" ######### git end ######### "

" ######### easymotion begin ######### "

let g:EasyMotion_leader_key = '<Space>' "定义easymotion快捷键的leader

" ######### easymotion end ######### "


" ######### MRU begin ######### "

nmap ;o :MRU<CR> 

" ######### MRU end ######### "


" ######### calendar-vim begin ######### "
nmap ;d ::Calendar<CR>
" ######### calendar-vim begin ######### "
