" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Liu Peng
"
"
"

" ===
" === 首次使用自动加载插件管理器
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" === 创建语言解释器的位置
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim





"" ###################   基本设置    ######################################

set history=1000                                                    "设置历史操作记录为1000条
set nocompatible                                                    " 不启用vi的键盘模式,而是vim自己的
syntax on                                                           " 语法高亮支持
"filetype off                                                       " 关闭文件类型自动检测功能,这个功能被filetype plugin indent on代替
filetype plugin indent on                                          " 载入文件类型插件,代替filetype off 
set guifont=Hack:h11                                                " 设置字体
packadd! dracula
syntax enable
colorscheme dracula													" 设置dracula高亮主题
"set background=light                                               " 设置vim背景为浅色
"set background=dark                                                 " 设置vim背景为深色
" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos
set backspace=2                                                     " 设置退格键可用
set autoindent                                                      " 自动对齐
set ai!                                                             " 设置自动缩进
set smartindent                                                     " 智能自动缩进
set relativenumber                                                  " 开启相对行号
set nu!                                                             " 显示行号
set ruler                                                           " 右下角显示光标位置的状态行
set incsearch                                                       " 开启实时搜索功能
set hlsearch                                                        " 开启高亮显示结果
set nowrapscan                                                      " 搜索到文件两端时不重新搜索
"set nocompatible                                                    " 关闭兼容模式
set hidden                                                          " 允许在有未保存的修改时切换缓冲区
set autochdir                                                       " 设定文件浏览器目录为当前目录
set foldmethod=indent                                               " 选择代码折叠类型
set foldlevel=100                                                   " 禁止自动折叠
set laststatus=2                                                    " 开启状态栏信息
set cmdheight=2                                                     " 命令行的高度，默认为1，这里设为2
set autoread                                                        " 当文件在外部被修改时自动更新该文件
"set nobackup                                                        " 不生成备份文件
"set noswapfile                                                      " 不生成交换文件

silent !mkdir -p ~/.config/nvim/tmp/backup							" 创建备份文件存放目录
silent !mkdir -p ~/.config/nvim/tmp/undo							" 创建交换文件存放目录
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.							" 指定配置文件路径
set directory=~/.config/nvim/tmp/backup,.							" 指定交换文件路径 
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.							" 指定撤销文件的路径
endif

set virtualedit=block												" 允许可视列块模式的虚拟编辑
set nrformats=                                                      " 关闭八进制
set list                                                            " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\|\ ,trail:▫
set expandtab                                                       " 将 Tab 自动转化成空格 [需要输入真正的 Tab 符时，使用 Ctrl+V + Tab]
set showmatch                                                       " 显示括号配对情况
au GUIEnter * simalt ~x                                             " 启动时自动最大化窗口
"winpos 0 0                                                         " 指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=100 columns=110                                          " 指定窗口大小，lines 为高度，columns 为宽度
set guioptions+=c                                                   " 使用字符提示框
set guioptions-=m                                                   " 隐藏菜单栏
set guioptions-=T                                                   " 隐藏工具栏
set guioptions-=L                                                   " 隐藏左侧滚动条
set guioptions-=r                                                   " 隐藏右侧滚动条
set guioptions-=b                                                   " 隐藏底部滚动条
set showtabline=0                                                   " 隐藏Tab栏
set cursorline                                                      " 高亮突出当前行
"set cursorcolumn                                                   " 高亮突出当前列
set shiftwidth=4                                                    " 设置通用缩进策略 [四空格缩进]
set tabstop=4                                                       " 设置通用缩进策略 [四空格缩进]
set softtabstop=4                                                   "
set scrolloff=4                                                     "
set noexpandtab                                                     "
set ttimeoutlen=0                                                   "
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set clipboard+=unnamedplus
autocmd FilterWritePre * if &diff | setlocal wrap< | endif      " 使用 vimdiff 时，长行自动换行

" 打开文件时自动到文件最后的行
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif




" ===
" ===  终端的设置
" ===
"let g:neoterm_autoscroll = 1
"autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>
"tnoremap <C-O> <C-\><C-N><C-O>
"let g:terminal_color_0  = '#000000'
"let g:terminal_color_1  = '#FF5555'
"let g:terminal_color_2  = '#50FA7B'
"let g:terminal_color_3  = '#F1FA8C'
"let g:terminal_color_4  = '#BD93F9'
"let g:terminal_color_5  = '#FF79C6'
"let g:terminal_color_6  = '#8BE9FD'
"let g:terminal_color_7  = '#BFBFBF'
"let g:terminal_color_8  = '#4D4D4D'
"let g:terminal_color_9  = '#FF6E67'
"let g:terminal_color_10 = '#5AF78E'
"let g:terminal_color_11 = '#F4F99D'
"let g:terminal_color_12 = '#CAA9FA'
"let g:terminal_color_13 = '#FF92D0'
"let g:terminal_color_14 = '#9AEDFE'



"##################################按键设置##################################

" 普通模式下 将 ; 默认为 :
noremap ; :
noremap : ;
" F6自动格式化python文件
"autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>

" \ /k/l/h <LEADER> = \ 分屏窗口移动 Normal mode
noremap <LEADER>j <C-W>j
noremap <LEADER>k <C-W>k
noremap <LEADER>l <C-W>l
noremap <LEADER>h <C-W>h


" Disable the default s key
noremap s <nop>


" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" make Y to copy till the end of the line 
nnoremap Y y$

" Copy to system clipboard
"  复制到系统粘贴板
vnoremap Y "+y
vnoremap P "+p
" 折叠行
noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>


" 关闭高亮显示
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" 替换全局 TAB
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" 折叠
noremap <silent> <LEADER>o za

" 打开 lazygit
"noremap <LEADER>g :Git 
"noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" 格式化
nnoremap \f :Autoformat<CR>
"map <C-A> ggVG                              " 全选 + 复制
"map! <C-A> <Esc>ggVG                        " 全选 + 复制

"ctrl+f 复制到系统粘贴板
"map  <C-F> "+y
"map! <C-F> "+y

" ##########################   自动编译文件    ######################################
" F5 自动编译文件 Normal+Visual mode
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run -d iPhone\ 11\ Pro
		CocCommand flutter.dev.openDevLog
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" ************** vim的配色 **************
"hi vertsplit ctermbg=bg guibg=bg
"hi GitGutterAdd ctermbg=bg guibg=bg
"hi GitGutterChange ctermbg=bg guibg=bg
"hi GitGutterDelete ctermbg=bg guibg=bg
"hi GitGutterChangeDelete ctermbg=bg guibg=bg
"hi SyntasticErrorSign ctermbg=bg guibg=bg
"hi SyntasticWarningSign ctermbg=bg guibg=bg
"hi FoldColumn ctermbg=bg guibg=bg



"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"language messages zh_CN.utf-8


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


" ==
" == GitGutter
" ==
"let g:gitgutter_signs = 0
"let g:gitgutter_map_keys = 0
"let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_preview_win_floating = 1
"autocmd BufWritePost * GitGutter
"nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
"nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
"nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" ===
" === MarkdownPreview
" ===
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_close = 1
"let g:mkdp_refresh_slow = 0
"let g:mkdp_command_for_global = 0
"let g:mkdp_open_to_the_world = 0
"let g:mkdp_open_ip = ''
"let g:mkdp_echo_preview_url = 0
"let g:mkdp_browserfunc = ''
"let g:mkdp_preview_options = {
"			\ 'mkit': {},
"			\ 'katex': {},
"			\ 'uml': {},
"			\ 'maid': {},
"			\ 'disable_sync_scroll': 0,
"			\ 'sync_scroll_type': 'middle',
"			\ 'hide_yaml_meta': 1
"			\ }
"let g:mkdp_markdown_css = ''
"let g:mkdp_highlight_css = ''
"let g:mkdp_port = ''
"let g:mkdp_page_title = '「${name}」'
" vimtex 配置
"g:vimtex_compiler_method




"******************ncm2 设置***************
" 为所有缓冲区启用ncm2
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"set shortmess+=c
"inoremap <c-c> <ESC>
"" 延迟弹窗,这样提示更加流畅
"let ncm2#popup_delay = 5
""输入几个字母开始提醒:[[最小优先级,最小长度]]
""如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在3个字符弹出,如果大于等于7,则2个字符抬出----优先级概念请参考文档中 ncm2-priority 
"let ncm2#complete_length = [[1, 1]]
"" enable ncm2 for all buffers
"
""模糊匹配模式,详情请输入:help ncm2查看相关文档
"let g:ncm2#matcher = 'substrfuzzy'
""使用tab键向下选择弹框菜单
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
""使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
"inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"   
"" 插入模式下,光标变成细线
"if has("autocmd")
"  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"  au InsertEnter,InsertChange *
"    \ if v:insertmode == 'i' | 
"    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
"    \ elseif v:insertmode == 'r' |
"    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
"    \ endif
"  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
"endif







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
"let g:instant_markdown_slow = 1
" 手动打开预览窗口 默认值：1
"let g:instant_markdown_autostart = 1
"默认情况下，服务器仅在localhost上侦听。要使服务器可用于网络中的其他人
"let g:instant_markdown_open_to_the_world = 0
" 启用脚本
"let g:instant_markdown_allow_unsafe_content = 1
" 是否允许使用外部资源，例如图像。默认开启
"let g:instant_markdown_allow_external_content = 1
"默认情况下，不会渲染Markdown中嵌入的TeX代码。该选项使用MathJax并以方式启动节点服务器instant-markdown-d --mathjax。
"let g:instant_markdown_mathjax = 1
" 将启动日志保存到文件中，方便查处错误
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" 默认开启 自动到光标所在的位置
"let g:instant_markdown_autoscroll = 1
" 自定义端口
"let g:instant_markdown_port = 8090
"let g:instant_markdown_python = 1



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

" ###############################   COC 代码补全插件配置   #######################################################
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>









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
" Python自动插入文件标题
 autocmd BufNewFile *.py exec ":call SetPythonTitle()"
func SetPythonTitle()
  call setline(1,"# Copyright (c) StilesYu  All Rights Reserved.")
  call append(line("."), "\# File Name: ".("%"))
  call append(line(".")+1, "\# Author: Stiles Yu")
  call append(line(".")+2, "\# mail: 13891328530@163.com")
  call append(line(".")+3,"\# github:https://github.com/Stilesyu")
  call append(line(".")+4,"\# blog:http://www.stilesyu.com/")
 call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G o
endfunc





"#####################       安装插件               #########################
"
call plug#begin()
"启动vim或nvim你将看到一个酷酷的启动界面
Plug 'mhinz/vim-startify'
" 吸血鬼 主题
Plug 'dracula/vim', { 'as': 'dracula' }
"gruvbox 主题
"Plug 'morhetz/gruvbox'
"vim-airline 底部状态栏优化
Plug 'bling/vim-airline'
" 主题安装
"Plug 'ajmwagar/vim-deus'
"*************代码补全******************
"ncm2 代码补全
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
""Plug 'HansPinckaers/ncm2-jedi'
""jedi-vim 作用同样是代码补全,这里协助ncm2,仅开启方法参数提醒
""Plug 'davidhalter/jedi-vim'
"" css补全插件
"Plug 'ncm2/ncm2-cssomni'
"" javascript 补全插件
"Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
"java 补全插件
"Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
"Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}

" ------------------------------------------------------

"COC 补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
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


" Git
Plug 'tpope/vim-fugitive'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }

" HTML, CSS, JavaScript, PHP, JSON, etc.
" Json 文件的语法高亮包
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" JavaScript 文件的语法搞两包
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" Markdown
" md 时式预览插件
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
Plug 'theniceboy/bullets.vim'

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
call plug#end()
