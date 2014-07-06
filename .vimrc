" 打开语法高亮
syntax enable
syntax on
 
" 打开对文件类型插件的支持
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"set nocp
"set et 
"set smarttab 
set st=4
"设置tab为4个空格
set sw=4
"set ai
"set si
"set nu
"打开鼠标功能
"set mouse=a

"set autochdir "自动设当前编辑的文件所在目录为当前工作路径 
nmap ;ad :set autochdir!<CR>
nmap ;nu :set nu! <CR>
"set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,big5
"快捷宏
nmap ;r @q

"打开搜索高亮
set hlsearch  
nmap ;sc :set hlsearch!<CR>
nmap ;cc :nohl<CR>
"##########删除操作 begin###############"
nmap ;de d$
nmap ;dh d0

"##########删除操作end###############"

"##########自己的脚本 begin###############"
"插入bash解释器
nmap ;sh :1! vim.bash.sh<CR>
nmap ;new :1! vim.newlisp.sh<CR>
nmap ;gg :.! googleapi.sh<CR>
"插入时间
nmap ;date :.! mydate.sh<CR>
nmap ;id :.! vim.uid.sh<CR>
"插入分割线
nmap ;l :.! vim.line.sh<CR>
"把文本路径写入 可以用 getpath.sh 获取
nmap ;tp :!topath.sh<CR>
"##########自己的脚本 end ###############"


"##########保存 begin ###############"
nmap ;w :w<CR>
nmap ;st :set paste<CR>
nmap pwd :pwd<CR>
map <F5> :w<CR>
imap <F5> <esc>:w<CR>a
map <F2> :wq<CR>
nmap ;wq :wq<CR>
imap <F2> <esc>:wq<CR>
nmap ;q :q<CR>
nmap .0 :q<CR>
"##########保存 end ###############"

"##########移动 begin ###############"
nmap <space> i<space><esc>
imap <C-n> <esc>
"nmap <CR> o<ESC>x
nmap <C-m> o<ESC>x
nmap M i<CR><ESC>
nmap ge $

"##########移动 end ###############"


"跨文件复制粘贴
"vmap C "+y
"nmap P "+p
vmap cp "+y
nmap pt "+p

nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

"######### 语法高亮 begin ##########"
nmap sfn :set filetype=newlisp<CR>
nmap sfs :set filetype=sh<CR>
nmap sfa :set filetype=awk<CR>
nmap sfp :set filetype=python<CR>
nmap sfl :set filetype=lua<CR>
nmap sfj :set filetype=java<CR>
nmap sfc :set filetype=c<CR>
nmap sft :set filetype=txt<CR>
nmap sfrd :set filetype=remind<CR>

"######### 语法高亮 end ##########"

"######### 窗口管理 begin ##########"
nmap .k <C-w>k
nmap .j <C-w>j
nmap .h <C-w>h
nmap .l <C-w>l
nmap ;vsp :vsp<CR>
nmap ;sp  :sp<CR>
nmap .e <C-w>=
nmap .mw <c-w>\|
"nmap <silent> .mw <c-w>|
"nmap .mw <C-w>|
nmap ++ <C-w>+
nmap -- <C-w>-
nmap .. <C-w>>
nmap ,, <C-w><
nmap .mh <C-w>_
nmap .mm .mw.mh
nmap .o :only<CR>
nmap .q :qall<CR>
nmap .c :close<CR>
nmap .n :new<CR>

"######### 窗口管理 end ##########"

"######### 其他 begin ##########"

"######### 其他 end ##########"
function! ActiveEmacs()
   let expl=system('aEmacs.sh') 
endfunction
nmap ae :call ActiveEmacs()<CR>

function! ActiveChrome()
   let expl=system('aChrome.sh') 
endfunction
nmap ac :call ActiveChrome()<CR>

"######### 统计光标下单词数量 begin ##########"
function! CountWord()
   let expl=system('countword.sh ' .  expand("<cword>") . "  " . expand("%:p"))
       echo expl 
endfunction
nmap cw :call CountWord()<CR>
"######### 统计光标下单词数量 end ##########"

"######### 生成链接 begin ##########"
function! Dpath()
   let expl=system('vim.dpath.sh ' .  getline('.') . "  " . expand("%:p"))
       echo expl 
endfunction
nmap dp :call Dpath()<CR>

function! Spath()
   let expl=system('vim.spath.sh ' . expand("%:p"))
       "echo expl 
       .s/^/\=expl/
endfunction
nmap sp :call Spath()<CR>

function! GetSpath()
   let expl=system('getrspath.sh ' .  getline('.') )
     windo if
             \ expand("%")=="getspath-tmp" |
             \ q!|endif
       "bdelete getspath-tmp     
       5sp getspath-tmp 
          setlocal buftype=nofile bufhidden=hide noswapfile
          1,$d         
          1s/^/\=expl/
          1
endfunction
nmap gs :call GetSpath()<CR>
"######### 生成链接 end ##########"

" ######### VimWiki begin ######### "
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
 
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0
 
"let g:vimwiki_list = [{'path': '/home/jimila/Desktop/knowledge/mywiki','path_html': '/home/jimila/Desktop/knowledge/mywiki/html','auto_export': 1}]
let g:vimwiki_list = [{'path': '/home/jimila/Desktop/knowledge/mywiki','path_html': '/home/jimila/Desktop/knowledge/mywiki/html','auto_export': 0},
		  \ {'path': '/home/jimila/Desktop/knowledge/docwiki','path_html': '/home/jimila/Desktop/knowledge/docwiki/html','auto_export': 0} ]
" ######### VimWiki end ######### "

" ######### english begin ######### "
function! E2c()
   "let expl=system('google_translate.py en zh-CN  ' . expand("<cword>"))
   "let expl=system('googledic.py ' . expand("<cword>"))
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

"nmap ;c :call GetTrans()<CR>
"vmap ;c :call GetTrans()<CR>

nmap ;e :call C2e()<CR>
vmap ;e :call C2e()<CR>
" ######### english end ######### "

" ######### git begin ######### "

"set nocompatible               " 设置 vim 为不兼容 vi 模式
"filetype off                   " required

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
Bundle 'MRU'
Bundle 'TxtBrowser'
Bundle 'mru.vim'
Bundle 'utl.vim'
Bundle 'sketch.vim'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'YankRing.vim'
Bundle 'Gundo'
Bundle 'Tabular'
Bundle 'genutils'
Bundle 'multiselect'
Bundle 'AuthorInfo'
Bundle 'Mark'
Bundle 'pathogen.vim'
Bundle 'neocomplcache'
Bundle 'vis'
Bundle 'VisIncr'
Bundle 'number-marks'
"Bundle 'Lynx-Offline-Documentation-Browser'
Bundle 'vimgrep.vim'

Bundle 'ManPageView'
" non github reposo
" 非github的插件，使用其git地址
" Bundle 'git://git.wincent.com/command-t.git'


"filetype plugin indent on    " required!
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
"let g:EasyMotion_leader_key = '<Space>' "定义easymotion快捷键的leader
let g:EasyMotion_leader_key = 'f' "定义easymotion快捷键的leader
let g:EasyMotion_keys = 'asdfjkl'
let g:EasyMotion_mapping_b = 'fu'
" ######### easymotion end ######### "


" ######### MRU begin ######### "
nmap ;o :MRU<CR> 
" ######### MRU end ######### "


" ######### calendar-vim begin ######### "
nmap ;d :Calendar<CR>
" ######### calendar-vim begin ######### "




" ######### utl.vim begin ######### "
"nmap ;g :Utl<CR>
nmap ;g :Utl openLink underCursor split<CR>
" ######### utl.vim end ######### "


" ######### w3m.vim begin ######### "
let g:w3m#homepage = "http://www.baidu.com/"
"let g:w3m#homepage = "https://www.google.com.hk/"
"let g:w3m#search_engine = 'http://www.baidu.com/'
" ######### w3m.vim end ######### "

" ######### sketch.vim begin ######### "
"nmap ;t :call ToggleSketch()<CR> 
" ######### sketch.vim end ######### "


" ######### TxtBrowser end ######### "
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
au BufRead,BufNewFile *.txt setlocal ft=txt
let Txtbrowser_Search_Engine='http://www.baidu.com/s?wd=text&oq=text&f=3&rsp=2'
let TxtBrowser_Dict_Url='http://dict.cn/text'
" ######### TxtBrowser end ######### "


" ######### NERDTree begig ######### "
let g:NERDTreeBookmarksFile='/home/jimila/Desktop/vim/.NERDTreeBookmarks'
"nmap ;tree :NERDTree .<CR>
nmap ;t :NERDTree .<CR>
nmap ;ct :NERDTreeClose<CR>
nmap ;fd :NERDTreeFind<CR>
nmap <F12> ;ct;t

function! NERDTreeEchoCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        echomsg 'Current node: ' . n.path.str()
    endif
endfunction

function! NERDTreeOpenCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        let expl=system('myopen.sh ' . n.path.str())
    endif
endfunction

nmap ;no :call NERDTreeOpenCurrentNode()<CR>
" ######### NERDTree end ######### "


" ######### ConqueTerm  begine ######### "
nmap ;bs :ConqueTerm bash<CR>
" ######### ConqueTerm  end ######### "

" ######### AuthorInfo  begine ######### "
let g:vimrc_author='jimila'
let g:vimrc_email='lazyjml@163.com'
let g:vimrc_homepage=''
nmap <F4> :AuthorInfoDetect<cr>
" ######### AuthorInfo  end ######### "


" #########  NeoComplCache begine ######### "
"let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_DisableAutoComplete = 1
nmap ni :NeoComplCacheEnable<CR>
nmap ns :NeoComplCacheDisable<CR>
" #########  NeoComplCache  end ######### "

" #########  Yankring  begin ######### "
nmap yk ::YRShow<CR>
" #########  Yankring  end ######### "


let g:Signs_file_path_corey='/home/jimila/Desktop/marks/'


" #########  test  begin ######### "

"abbr sprt System.out.println
"autocmd FocusGained *.txt :echo 'Welcome back,' . $USER . '! You look,' . $USER . '!You look great!'
"autocmd! VimEnter * echo 2

"autocmd! VimEnter *.date Test
"自动提示我的要做什么
"autocmd! VimEnter * Rem

"autocmd! VimEnter * Test
"autocmd! VimEnter * call Rem() 


"set tw=78 fo+=Mm
nmap ;gq :set tw=78 fo+=Mm<CR>
" #########  test  end ######### "



" #########  vimgrep  begin ######### "

nmap co :copen<CR>
nmap cc :cclose<CR>
nmap cj :cn<CR>
nmap ck :cp<CR>
nmap cn <C-w><CR>
" #########  vimgrep  end ######### "

" #########  tabe  begin ######### "
nmap ,w :tabnew<CR>
"nmap ct :tabc<CR>
"nmap ,n :tabn<CR>
"nmap ,p :tabp<CR>
imap <c-j> <esc>:tabn<CR>
imap <c-k> <esc>:tabp<CR>
nmap <c-j> :tabn<CR>
nmap <c-k> :tabp<CR>
nmap ,t <C-w>T
" #########  tabe  end ######### "


" #########  misc  begin ######### "
let g:quicktask_snip_path = '/home/jimila/Desktop/task'

"quickfix有关
"nmap <S><CR> <C-w><CR> "没法设
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>
nmap ,s :source $HOME/.vimrc<CR>

call pathogen#infect()
"call pathogen#runtime_append_all_bundles() 
" #########  misc  end ######### "

" #########  lookupfile  begin ######### "
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序
"if filereadable("/home/jimila/Desktop/prolab/testvim/filenametags")                "设置tag文件的名字
"    let g:LookupFile_TagExpr ='"/home/jimila/Desktop/prolab/testvim/filenametags"'
"endif
if filereadable("/home/jimila/Desktop/knowledge/filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr ='"/home/jimila/Desktop/knowledge/filenametags"'
endif
" #########  lookupfile  end ######### "


"set shm+=I

nmap ;ss :call SessionManagerToggle()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


command! -nargs=0 Rem call Rem()
function! Rem()
       "let expl = system("myremind.sh")
       let expl = system("myremind.sh")
       "let expl = strtrans(system("date "))
"       echom expl
       if !empty(expl)
          10sp msg 
          setlocal buftype=nofile bufhidden=hide noswapfile
          1s/^/\=expl/
       endif
endfunction


" #########  powerline  begin ######### "
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs
"set guifont=PowerlineSymbols\ for\ Powerline
set t_Co=256
"let g:Powerline_symbols='fancy'
set noshowmode
"let g:Powerline_theme ='solarized256'
let g:Powerline_theme ='solarized16'
"let g:Powerline_colorscheme = 'solarized256'
" #########  powerline  end ######### "



" #########  notes  end ######### "

let g:notes_directory = '/home/jimila/Desktop/Notes'

" #########  notes  end ######### "

"autocmd FileType remind iabbrev 1M January
autocmd FileType remind source ~/Desktop/myvim/.rem.vim 
autocmd FileType txt source ~/Desktop/myvim/.txt.vim 


"set cmdheight=2
"set shortmess=a


" #########  trans  begin ######### "
let g:trans_map_trans=';tt'
let g:trans_map_to=';to'

" #########  trans  end ######### "

"let g:NERDTree_title='NERD Tree'
"let g:winManagerWindowLayout = "NERDTree,,BufExplorer"
"let g:winManagerWidth = 30
"nmap <silent> <leader>wm :WMToggle<cr>
"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction
"
"function! NERDTree_IsValid()
"    return 1
"endfunction



"let loaded_minibufexplorer = 0
"function! OpenMinibuf()
"let loaded_minibufexplorer = 1
"endfunction
"nmap ;om :call OpenMinibuf()<CR>

" #########  minibuf  begin ######### "

"let loaded_minibufexplorer = 1
let g:miniBufExplSplitToEdge = 0
nmap ;cm :CMiniBufExplorer<cr>
nmap ;um :UMiniBufExplorer<cr>
nmap ;tm :TMiniBufExplorer<cr>

" #########  minibuf  begin ######### "


" #########  fencview  begin ######### "
let g:fencview_autodetect = 0

" #########  fencview  end ######### "



let g:weibo_access_token ="C0CCFD0DFE600FF4F0DAFF7830108A14"

"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org  call org#SetOrgFileType()



"nmap <silent>  tom :call Tom(input("Enter comment: "))<CR>
nmap  tom :call Tom(input("Enter comment: "))<CR>
function! Tom(arg)
    let expl = system("getm.sh " . a:arg)
    cd `=expl`
    "exe 'cd '.expl 
endfunction

nmap ;vo :Voom<CR>


vmap ;ii :s/$/\r/g\|nohl<CR>

let g:user_emmet_expandabbr_key = '<c-e>'

"hi MatchParen ctermbg=yellow guibg=lightblue
"匹配括号颜色
hi MatchParen ctermbg=red guibg=lightblue


"silent! call repeat#set("\<Plug>MyWonderfulMap",v:count)


let marvim_store = '/home/jimila/Desktop/marvim' 


autocmd BufReadPost *
           \ if line("'\"") > 1 && line("'\"") <= line("$") |
           \   exe "normal! g`\"" |
           \ endif
