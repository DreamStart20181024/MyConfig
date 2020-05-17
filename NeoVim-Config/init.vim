"" ###################   基本设置    ######################################

" 判断操作系统类型
if(has('win32') || has('win64')) 
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif

"************常规设置****************
"设置历史操作记录为1000条
set history=1000
" 不启用vi的键盘模式,而是vim自己的
set nocompatible
" 语法高亮支持
syntax on
" 关闭文件类型自动检测功能,这个功能被filetype plugin indent on代替
filetype off
" 载入文件类型插件,代替filetype off 
filetype plugin indent on
" 判断是否处于 GUI 界面
if has('gui_running')
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

syntax enable                " 打开语法高亮
" ************** vim 的字体跟配色方案 ******************
" 设置着色模式和字体
colorscheme molokai
set guifont=Hack:h11
"set background=light                                           " 设置vim背景为浅色
set background=dark                                             " 设置vim背景为深色
"colorscheme gruvbox                                             " 设置gruvbox高亮主题
" ************** vim的配色 **************
"hi vertsplit ctermbg=bg guibg=bg
"hi GitGutterAdd ctermbg=bg guibg=bg
"hi GitGutterChange ctermbg=bg guibg=bg
"hi GitGutterDelete ctermbg=bg guibg=bg
"hi GitGutterChangeDelete ctermbg=bg guibg=bg
"hi SyntasticErrorSign ctermbg=bg guibg=bg
"hi SyntasticWarningSign ctermbg=bg guibg=bg
"hi FoldColumn ctermbg=bg guibg=bg

"set rop=type:directx,renmode:5 "Windows下的GVim增强显示
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=indent        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set nrformats=               " 关闭八进制
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.
set expandtab                " 将 Tab 自动转化成空格 [需要输入真正的 Tab 符时，使用 Ctrl+V + Tab]
set showmatch                " 显示括号配对情况
" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos
" 启动时自动最大化窗口
if g:isWIN
 au GUIEnter * simalt ~x
endif
"winpos 0 0              " 指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=100 columns=110   " 指定窗口大小，lines 为高度，columns 为宽度
set guioptions+=c          " 使用字符提示框
set guioptions-=m          " 隐藏菜单栏
set guioptions-=T          " 隐藏工具栏
set guioptions-=L          " 隐藏左侧滚动条
set guioptions-=r          " 隐藏右侧滚动条
set guioptions-=b          " 隐藏底部滚动条
set showtabline=0          " 隐藏Tab栏
set cursorline             " 高亮突出当前行
"set cursorcolumn         " 高亮突出当前列
" 设置通用缩进策略 [四空格缩进]
set shiftwidth=4
set tabstop=4
" 使用 vimdiff 时，长行自动换行
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif


"------------------- python 文件设置--------------------
" 开启语法高亮
"let python_highlight_all=1
"" 设定tab的格数为4
"au Filetype python set tabstop=4
"" 设置编辑模式下tab的宽度
"au Filetype python set softtabstop=4
"au Filetype python set shiftwidth=4
"au Filetype python set textwidth=79
"au Filetype python set expandtab
"au Filetype python set autoindent
"au Filetype python set fileformat=unix
"autocmd Filetype python set foldmethod=indent
"autocmd Filetype python set foldlevel=99





"##################################按键设置##################################

" F6自动格式化
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>

" ctrl-j/k/l/h  分屏窗口移动 Normal mode
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" ctrl+s 保存 	Insert mode
" linux默认情况下ctrl+s是锁定terminal,需要ctrl+q解锁.在.bashrc 设置 stty-ixon可以禁用
"imap <C-s> <Esc>:w!<CR>i
"ctrl+a	全选+复制 Normal+Insert+visual mode
map <C-A> ggVG
map! <C-A> <Esc>ggVG
"ctrl+f 复制到系统粘贴板
"map  <C-F> "+y
"map! <C-F> "+y

" F5 自动编译文件 Normal+Visual mode
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear":
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc



"#####################      插件配置               #########################

" *********** NERDTree插件配置 ***********
"树形目录开关
map <F3> :NERDTreeMirror<CR> 
map <F3> :NERDTreeToggle<CR> 
" 当只剩 文件窗口管理器时 关闭 vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 更改默认的 箭头 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 默认打开NERDTree
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=25                                          " 设置窗口宽度为25
let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭
" 打开文件默认开启文件树
"autocmd VimEnter * NERDTree

"******************auto format设置***************
"vim-autopep8设置,关闭diff提示
let g:autopep8_disable_show_diff=1

"******************ncm2 设置***************
" 为所有缓冲区启用ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
" 延迟弹窗,这样提示更加流畅
let ncm2#popup_delay = 5
"输入几个字母开始提醒:[[最小优先级,最小长度]]
"如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在3个字符弹出,如果大于等于7,则2个字符抬出----优先级概念请参考文档中 ncm2-priority 
let ncm2#complete_length = [[1, 1]]
" enable ncm2 for all buffers

"模糊匹配模式,详情请输入:help ncm2查看相关文档
let g:ncm2#matcher = 'substrfuzzy'
"使用tab键向下选择弹框菜单
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
"使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"   
" 插入模式下,光标变成细线
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"****************jedi-vim设置*******************
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
"如果你想启用这个功能,auto_initialization必须开启
let g:jedi#show_call_signatures = 1
"  MD 文集实施预览插件配置   vim-instant-markdown
filetype plugin on
"Uncomment to override defaults:
" 取消注释已覆盖默认值
" ----------- 0：表示关闭；1：表示开启---------------
let g:instant_markdown_slow = 1
" 手动打开预览窗口 默认值：1
let g:instant_markdown_autostart = 1
"默认情况下，服务器仅在localhost上侦听。要使服务器可用于网络中的其他人
let g:instant_markdown_open_to_the_world = 0
" 启用脚本
let g:instant_markdown_allow_unsafe_content = 1
" 是否允许使用外部资源，例如图像。默认开启
let g:instant_markdown_allow_external_content = 1
"默认情况下，不会渲染Markdown中嵌入的TeX代码。该选项使用MathJax并以方式启动节点服务器instant-markdown-d --mathjax。
"let g:instant_markdown_mathjax = 1
" 将启动日志保存到文件中，方便查处错误
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" 默认开启 自动到光标所在的位置
let g:instant_markdown_autoscroll = 1
" 自定义端口
let g:instant_markdown_port = 8090
let g:instant_markdown_python = 1



"  MD 文件预览插件配置
"function! BuildComposer(info)
"  if a:info.status != 'unchanged' || a:info.force
"    if has('nvim')
"      !cargo build --release --locked
"    else
"      !cargo build --release --locked --no-default-features --features json-rpc
"    endif
"  endif
"endfunction



"" ####################################定义SetTitle，自动插入文件头##############################
"func SetTitle()
"    "如果文件类型为.sh文件
"	if &filetype == ‘sh‘
"         call setline(1,"\#########################################################################")
"
"        call append(("."), "\# File Name: ".("%"))
"
"         call append(line(".")+1, "\# Author: Stilesyu")
"
"         call append(line(".")+2, "\# mail: yuxiaochen886@gmail.com")
"
" 
"    "call append((".")+3, "\# Created Time: ".strftime("%c"))
"         call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
"
"         call append(line(".")+4, "\#########################################################################")
"
"         call append(line(".")+5, "\#!/bin/bash")
"
"         call append(line(".")+6, "")
"
"     else
"
"        call setline(1, "/*************************************************************************")
"
"        call append(line("."), "    > File Name: ".("%"))
"
"        call append(line(".")+1, "    > Author: YourName")
"
"        call append(line(".")+2, "    > Mail: YourEmail ")
"
"       " 同样的 改变时间格式
"        "call append((".")+3, "    > Created Time: ".strftime("%c"))
"        call append((".")+3, "    > Created Time: ".strftime("%Y-%m-%d",localtime()))
"
"        call append((".")+4, " ************************************************************************/")
"
"        call append(line(".")+5, "")
"
"     endif
"
"     if &filetype == ‘‘
"
"        call append(line(".")+6, "#include<iostream>")
"
"         call append(line(".")+7, "using namespace std;")
"
"        call append(line(".")+8, "")
"
"    endif
"
"    if &filetype == ‘c‘
"
"         call append(line(".")+6, "#include<stdio.h>")
"
"       call append(line(".")+7, "")
"
"    endif
" 
"   "新建文件后，自动定位到文件末尾
"    autocmd BufNewFile * normal G
" endfunc
"
"" Python自动插入文件标题
" autocmd BufNewFile *py exec ":call SetPythonTitle()"
" func SetPythonTitle()
"  call setline(1,"# Copyright (c) StilesYu  All Rights Reserved.")
"  call append(line("."), "\# File Name: ".("%"))
"  call append(line(".")+1, "\# Author: Stiles Yu")
"  call append(line(".")+2, "\# mail: yuxiaochen886@gmail.com")
"  call append(line(".")+3,"\# github:https://github.com/Stilesyu")
"  call append(line(".")+4,"\# blog:http://www.stilesyu.com/")
"  call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
" endfunc
""新建文件后，自动定位到文件末尾
" autocmd BufNewFile * normal G o





"#####################       安装插件               #########################
"
call plug#begin()
"启动vim或nvim你将看到一个酷酷的启动界面
Plug 'mhinz/vim-startify'
"gruvbox 主题
Plug 'morhetz/gruvbox'
"vim-airline 底部状态栏优化
Plug 'bling/vim-airline'
" 主题安装
"Plug 'ajmwagar/vim-deus'
"*************代码补全******************
"ncm2 代码补全
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"Plug 'HansPinckaers/ncm2-jedi'
"jedi-vim 作用同样是代码补全,这里协助ncm2,仅开启方法参数提醒
"Plug 'davidhalter/jedi-vim'
" css补全插件
Plug 'ncm2/ncm2-cssomni'
" javascript 补全插件
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
"java 补全插件
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}

"*************效率工具*******************
"vim-autopep8,自动格式化
Plug 'tell-k/vim-autopep8'
"snipmate 模板补全----按tab键根据模板自动补全
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Optional:
Plug 'honza/vim-snippets'
"自动引号/括号
Plug 'jiangmiao/auto-pairs'

"*************其他工具******************
"nerdtree 文件树
Plug 'scrooloose/nerdtree'

" 添加底部状态栏
"Plug 'vim-airline/vim-airline'
"底部状态栏主题"
"Plug 'vim-airline/vim-airline-themes'
"创建HTML文件模板
Plug 'mattn/emmet-vim'
" 主题管理插件
Plug 'itchyny/lightline.vim'
" 括号匹配
Plug 'jiangmiao/auto-pairs'
" 符号匹配
Plug 'junegunn/vim-easy-align'

" 安装 Markdown预览插件,此插件换需要安装rust插件
"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Vim语言包的集合。
"属于开箱即用型的语法高亮包
Plug 'sheerun/vim-polyglot'
" html5的语法高亮包
Plug 'othree/html5.vim'
" MD 文件的语法高亮包
Plug 'plasticboy/vim-markdown'
" Json 文件的语法高亮包
Plug 'elzr/vim-json'
" JavaScript 文件的语法搞两包
Plug 'pangloss/vim-javascript'
" css 文件的语法高亮包
Plug 'JulesWang/css.vim'
" css3 的语法高亮插件
"  与css.vim 有冲突先注释掉
"Plug 'hail2u/vim-css3-syntax'
" Python 文件的语法高亮包
Plug 'mitsuhiko/vim-python-combined'
" 该vim软件包为动态样式表语言LESS添加了语法突出显示，缩进和自动完成功能。
"Plug 'groenewege/vim-less'
"TypeScript的语法文件和其他设置。语法文件来自此博客文章。
"安装文件后，无论何时编辑.ts文件，都会自动启用语法高亮显示和其他设置。
Plug 'leafgarland/typescript-vim'
" 补充一个 Vue 模板的
"Vue.js组件的语法突出显示
Plug 'posva/vim-vue'
" JavaScript 补全
"Plug 'Valloric/YouCompleteMe'
" JavaScript 自动补全 与 Valloric/YouCompleteMe 配合使用
"Plug 'ternjs/tern_for_vim'
" 色彩高亮，例子: #66CCFF
Plug 'gorodinskiy/vim-coloresque'
" md 实施预览插件
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
call plug#end()
