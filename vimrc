"==========================================
" Author:  wklken
" Version: 9.1
" Email: wklken@yeah.net
" BlogPost: http://www.wklken.me
" ReadMe: README.md
" Donation: http://www.wklken.me/pages/donation.html
" Last_modify: 2015-12-15
" Sections:
"       -> Initial Plugin 加载插件
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> HotKey Settings  自定义快捷键
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================

"==========================================
" Initial Plugin 加载插件
"==========================================

" 修改leader键
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" 开启语法高亮
syntax on

" install bundles
 if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
 elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
    source ~/.config/nvim/vimrc.bundles
 endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

" NOTE: 以下配置有详细说明，一些特性不喜欢可以直接注解掉

"==========================================
" General Settings 基础设置
"==========================================


" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile

set clipboard=unnamed

" TODO: remove this, use gundo
" create undo file
" if has('persistent_undo')
  " " How many undos
  " set undolevels=1000
  " " number of lines to save for undo
  " set undoreload=10000
  " " So is persistent undo ...
  " "set undofile
  " set noundofile
  " " set undodir=/tmp/vimundo/
" endif

" 突出显示当前列
" set cursorcolumn
" 突出显示当前行
" set cursorline


" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=


" 鼠标暂不启用, 键盘党....
set mouse-=a
" 启用鼠标
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide


" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number
" 取消换行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
" set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=2
" 每一次缩进对应的空格数
set shiftwidth=2
" 按退格键时可以一次删掉 4 个空格
set softtabstop=2
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
" autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
" autocmd! bufwritepost .vimrc source %

" autocmd! bufwritepost vimrc source %
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" set completeopt=longest,menu
set completeopt=menu,menuone

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class,*.swp,*.bak,*.pyc,*.class,.svn
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>



" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>


"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 - F6 设置

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
noremap H ^
noremap L $


" Map ; to : and save a million keystrokes 用于快速进入命令行
" nnoremap ; :

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>


" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select block
nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Jump to start and end of line using the home row keys
" 增强tab操作, 导致这个会有问题, 考虑换键
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.k-vim/vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>



" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py,*.cc exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\# !/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" TEMP 设置, 尚未确定要不要
"==========================================

" tmux
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif
"
"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"
"
"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction
"
" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" allows cursor change in tmux mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" if exists('$TMUX')
    " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif


"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    " set guifont=Sauce_Code_Powerline:h14
    " set guifont=InconsolataFor\ Nerd\ Font\ Mono:h13
    set guifont=mononoki\ Nerd\ Font\ Mono:h12
    " set guifont=Fira\ Code:h12
    " set guifont=SourceCodePro\ Nerd\ Font\ Mono:h12
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

if has('gui_running')
  if has('win32')
    au GUIEnter * simalt ~x
    " set renderoptions=type:directx
    set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:100.0,geom:1,renmode:5,taamode:1
  endif
endif



" theme主题
set background=dark
set t_Co=256

" colorscheme solarized
" colorscheme molokai
" colorscheme desert
colorscheme onedark


" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Ack {
  if isdirectory(expand("~/.vim/bundle/ack.vim"))
    if executable('ag')
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
      " When you press gv you Ag after the selected text
      vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
      nnoremap <leader>g :Ack
    endif
  endif
"
" }
"

" vim-multiple-cursors {
  if isdirectory(expand("~/.vim/bundle/vim-multiple-cursors"))
    let g:multi_cursor_next_key="\<C-s>"
  endif
" }

" ################### 快速导航 ###################

" nerdtree nerdtreetabs {{{
    " map <leader>n :NERDTreeToggle<CR>
    " nerdtreetabs
    " 关闭同步
" }}}


" Vim Workspace Controller
" ctrlspace {{{
    " let g:airline_exclude_preview = 1
    " hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    " hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    " hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    " hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
" }}}



" NerdTree {
  if isdirectory(expand("~/.vim/bundle/NerdTree"))
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ] "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    nnoremap <leader>nn :NERDTreeToggle<cr>
    nnoremap <leader>nb :NERDTreeFromBookmark
    nnoremap <leader>nf :NERDTreeFind<cr>
    let g:nerdtree_tabs_synchronize_view=0
    let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    " thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
  endif
" }

" vim-airline {
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'
    if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
        let g:airline_powerline_fonts=1
        let g:airline#extensions#tabline#enabled = 1
        if !exists('g:airline_theme')
            let g:airline_theme = 'onedark'
        endif
        " if !exists('g:airline_powerline_fonts')
            " " Use the default set of separators with a few customizations
            " let g:airline_left_sep='›'  " Slightly fancier than '>'
            " let g:airline_right_sep='‹' " Slightly fancier than '<'
        " endif
    endif
" }

" clang-format {
  if isdirectory(expand("~/.vim/bundle/vim-clang-format/"))
    let g:clang_format#code_style = 'Chromium'
  endif
" }

" YouCompleteMe {{{
  if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))
      "youcompleteme  默认tab  s-tab 和自动补全冲突
      "let g:ycm_key_list_select_completion=['<c-n>']
      let g:ycm_add_preview_to_completeopt = 0
      let g:ycm_show_diagnostics_ui = 0
      let g:ycm_server_log_level = 'info'
      let g:ycm_min_num_identifier_candidate_chars = 2

      let g:ycm_key_list_select_completion = ['<Down>']
      "let g:ycm_key_list_previous_completion=['<c-p>']
      let g:ycm_key_list_previous_completion = ['<Up>']
      let g:ycm_complete_in_comments = 0  "在注释输入中也能补全
      let g:ycm_complete_in_strings = 0   "在字符串输入中也能补全
      let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
      let g:ycm_collect_identifiers_from_comments_and_strings = 0   "注释和字符串中的文字也会被收入补全
      let g:ycm_collect_identifiers_from_tags_files = 1
      " 开启语法关键字补全
      let g:ycm_seed_identifiers_with_syntax=1
      " 回车作为选中
      let g:ycm_key_list_stop_completion = ['<CR>']


      " 跳转到定义处, 分屏打开
      let g:ycm_goto_buffer_command = 'horizontal-split'
      let g:ycm_register_as_syntastic_checker = 0

      let g:ycm_key_invoke_completion = '<c-z>'

      " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
      nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
      nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

      " 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
      " old version
      if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
          let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
      endif
      " new version
      if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
          let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
      endif

      " 直接触发自动补全 insert模式下
      " let g:ycm_key_invoke_completion = '<C-Space>'
      " 黑名单,不启用
      let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'gitcommit' : 1,
          \}

      let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }
  endif
" }}}

let g:webdevicons_enable = 0


" delimitMate {{{
    " for python docstring ",优化输入
    if isdirectory(expand("~/.vim/bundle/delimitMate/"))
      au FileType python let b:delimitMate_nesting_quotes = ['"']
      au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
      " 关闭某些类型文件的自动补全
      "au FileType mail let b:delimitMate_autoclose = 0
    endif
" }}}


" closetag {{{
   if isdirectory(expand("~/.vim/bundle/closetag.vim"))
    let g:closetag_html_style=1
  endif
" }}}

" ################### 快速编码 ###################

" easyalign {{{
  if isdirectory(expand("~/.vim/bundle/vim-easy-align"))
    vmap <Leader>a <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
    " Default:
    " If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
    let g:easy_align_ignore_groups = ['Comment', 'String']
  endif
" }}}

" ################### 快速移动 ###################

" easymotion {{{
  if isdirectory(expand("~/.vim/bundle/vim-easymotion"))
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
  endif
" }}}


" quickscope {{{
  if isdirectory(expand("~/.vim/bundle/quick-scope"))
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    " macvim/gvim会有问题, 暂时注解
    " let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
    " let g:qs_first_occurrence_highlight_color = 155       " terminal vim
    " let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
    " let g:qs_second_occurrence_highlight_color = 81         " terminal vim
  endif
" }}}

" ################### 快速选中 ###################

" expandregion {{{
  if isdirectory(expand("~/.vim/bundle/vim-expand-region"))
    " map + <Plug>(expand_region_expand)
    " map _ <Plug>(expand_region_shrink)
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)
    " Extend the global default
    call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })
  endif
" }}}

" multiplecursors {{{
  if isdirectory(expand("~/.vim/bundle/vim-multiple-cursors"))
    let g:multi_cursor_use_default_mapping=0
    " Default mapping
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
  endif
" }}}

" ################### 功能相关 ###################

" ctrlp ctrlpfunky{{{
  if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    " map <leader>f :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
    " 如果安装了ag, 使用ag
    " if executable('ag')
    " " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0
    " endif
    nnoremap <leader>b :CtrlPBuffer<CR>

    " ctrlpfunky
    " ctrlp插件1 - 不用ctag进行函数快速跳转
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    let g:ctrlp_funky_syntax_highlight = 1

    let g:ctrlp_extensions = ['funky']
  endif
" }}}


" ctrlsf {{{
    nmap \ <Plug>CtrlSFCwordPath<CR>
    " let g:ctrlsf_position = 'below'
    " let g:ctrlsf_winsize = '30%'
    let g:ctrlsf_auto_close = 0
    let g:ctrlsf_confirm_save = 0
    " Note: cannot use <CR> or <C-m> for open
    " Use : <sapce> or <tab>
    let g:ctrlsf_mapping = {
        \ "open"  : "<Space>",
        \ "openb" : "O",
        \ "tab"   : "t",
        \ "tabb"  : "T",
        \ "prevw" : "p",
        \ "quit"  : "q",
        \ "next"  : "<C-J>",
        \ "prev"  : "<C-K>",
        \ "pquit" : "q",
        \ }
" }}}

if isdirectory(expand("~/.vim/bundle/lightline.vim"))
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ }
endif


" ultisnips {{{
if isdirectory(expand('~/.vim/bundle/ultisnips'))
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
    " 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    map <leader>us :UltiSnipsEdit<CR>

    " ctrl+j/k 进行选择
    func! g:JInYCM()
        if pumvisible()
            return "\<C-n>"
        else
            return "\<c-j>"
        endif
    endfunction

    func! g:KInYCM()
        if pumvisible()
            return "\<C-p>"
        else
            return "\<c-k>"
        endif
    endfunction
    inoremap <c-j> <c-r>=g:JInYCM()<cr>
    au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
    let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
endif
" }}}
"
" closetag {{{
if isdirectory(expand('~/.vim/bundle/closetag.vim'))
    let g:closetag_html_style=1
endif
" }}}
"
" nerdcommenter {{{
if isdirectory(expand('~/.vim/bundle/nerdcommenter'))
    let g:NERDSpaceDelims=1
    let g:NERDAltDelims_python = 1
endif
" }}}
"

" trailingwhitespace {{{
if isdirectory(expand('~/.vim/bundle/vim-trailing-whitespace'))
    map <leader>s :FixWhitespace<cr>
endif
" }}}


" easyalign {{{
if isdirectory(expand('~/.vim/bundle/vim-easy-align'))
    vmap <Leader>a <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
    " Default:
    " If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
    let g:easy_align_ignore_groups = ['Comment', 'String']
endif
" }}}

" rainbow_parentheses {{{
if isdirectory(expand('~/.vim/bundle/rainbow_parentheses.vim'))
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif
" }}}


" ################### 显示增强-主题 ###################"

" solarized {{{
if isdirectory('~/.vim/bundle/vim-colors-solarized')
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " let g:solarized_termcolors=256
endif
" }}}

" molokai {{{
if isdirectory('~/.vim/bundle/molokai')
    " monokai原始背景色
    let g:molokai_original = 1
    let g:rehash256 = 1
endif
" }}}



" 标签导航
" tagbar {{{
if isdirectory(expand("~/.vim/bundle/tagbar/"))
    nmap <F9> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1
    " let g:tagbar_autoshowtag = 1
    " let g:tagbar_show_visibility = 1
    " for ruby
    let g:tagbar_type_ruby = {
        \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
        \ ]
    \ }

    " go语言的tagbar配置
    " 1. install gotags 'go get -u github.com/jstemmer/gotags'
    " 2. make sure `gotags` in you shell PATH, you can call check it with `which gotags`
    " for gotags. work with tagbar
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
endif
" }}}


" ################### 语言相关 ###################

" quickrun {{{
if isdirectory(expand('~/.vim/bundle/quickrun'))
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}

    let g:quickrun_no_default_key_mappings = 1
    nmap <Leader>r <Plug>(quickrun)
    map <F10> :QuickRun<CR>
endif
" }}}


" pythonsyntax {{{
    let python_highlight_all = 1
" }}}

" piv {{{
    let g:DisableAutoPHPFolding = 1
" }}}


" vimgo {{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_fmt_fail_silently = 1
    " format with goimports instead of gofmt
    let g:go_fmt_command = "goimports"
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'java'] }
" }}}


" markdown {{{
    let g:vim_markdown_folding_disabled=1
" }}}


" javascript {{{
    " pangloss/vim-javascript
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
" }}}

" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" css {{{
" }}}

" nginx {{{
" }}}


" XXXXXX PPP
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" }}}

" ####### temp #######

" beta {{{
    " pip install yapf
    " python code format
    " format all file
    autocmd FileType python nnoremap <localleader>y :0,$!yapf<Cr>
    " format select block
    autocmd FileType python vnoremap <localleader>y :!yapf<Cr>

    autocmd FileType json nnoremap <localleader>y :%!python -m json.tool<CR>

    " Plug 'posva/vim-vue'

    " Plug 'millermedeiros/vim-esformatter'
    " will run esformatter after pressing <leader> followed by the 'e' and 's'
    " keys
    " nnoremap <silent> <leader>es :Esformatter<CR>
    " vnoremap <silent> <leader>es :EsformatterVisual<CR>

" }}}

"------------------------------------------- end of configs --------------------------------------------
