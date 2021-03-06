map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc

""##################################
" 设置主题颜色
""##################################
"colorscheme blue 
"colorscheme corporation 
"colorscheme darkblue 
"colorscheme default 
"colorscheme delek 
"colorscheme desert 
"colorscheme elflord
"colorscheme evening 
"colorscheme jellybeans 
"colorscheme keohler 
"colorscheme molokai 
"colorscheme morning 
"colorscheme murphy
"colorscheme pablo 
"colorscheme peachpuff 
"colorscheme ron
"colorscheme shine 
"colorscheme slate 
"colorscheme torte 
"colorscheme zellner 

"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess=atI   									" 启动的时候不显示那个援助乌干达儿童的提示
"winpos 5 5          									" 设定窗口位置
"set lines=40 columns=155								" 设定窗口大小
set go=             									" 不要图形按钮  
"color asmanian2     									" 设置背景主题  
"set guifont=Courier_New:h10:cANSI						" 设置字体  
syntax enable
syntax on           									" 语法高亮  

set cursorline											" 高亮当前行
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
autocmd InsertLeave * se nocul  						" 用浅色高亮当前行  
autocmd InsertEnter * se cul    						" 用浅色高亮当前行  


"set ruler           									" 显示标尺  
set showcmd         									" 输入的命令显示出来，看的清楚些  
"set cmdheight=1     									" 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   								" 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     									" 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell    									" 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   
														" 状态行显示的内容  
set laststatus=1    									" 启动显示状态行(1),总是显示状态行(2)  
"set foldenable      									" 允许折叠  
"set foldmethod=manual   								" 手动折叠  
"set background=dark 									" 背景使用黑色 
set nocompatible										" 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

if version >= 603										" 显示中文帮助
	set helplang=cn
	set encoding=utf-8
endif

"colorscheme murphy										" 设置配色方案
"if (has("gui_running")) 								" 字体 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: Joney") 
		call append(line(".")+2, "\# mail: joneyzhou@aliyun.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	elseif &filetype == 'python' 
		call setline(1,"#!/usr/bin/env python") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: Joney") 
		call append(line(".")+2, "\# mail: joneyzhou@aliyun.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "") 
		call append(line(".")+5, "") 
	else
		call setline(1, "/***********************************************************************") 
		call append(line("."), "* File Name: ".expand("%")) 
		call append(line(".")+1, "* Author: Joney") 
		call append(line(".")+2, "* Mail: joneyzhou@aliyun.com ") 
		call append(line(".")+3, "* Created Time: ".strftime("%c")) 
		call append(line(".")+4, "************************************************************************/") 
	endif
	if &filetype == 'cpp'
		call append(line(".")+5, "#include<iostream>")
		call append(line(".")+6, "using namespace std;")
		call append(line(".")+7, "")
	endif
	if &filetype == 'c'
		call append(line(".")+5, "#include<stdio.h>")
		call append(line(".")+6, "")
	endif
	if &filetype == 'java'
		call append(line(".")+5,"public class ".expand("%"))
		call append(line(".")+6,"")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

map <C-A> ggVGY 									" 映射全选+复制 ctrl+a
map! <C-A> <Esc>ggVGY
map <F12> gg=G

vmap <C-c> "+y										" 选中状态下 Ctrl+c 复制
nnoremap <F2> :g/^\s*$/d<CR>						" 去空行  
nnoremap <C-F2> :vert diffsplit						" 比较文件

map <M-F2> :tabnew<CR>  							" 新建标签  
map <F3> :tabnew .<CR>  							" 列出当前目录文件  
map <C-F3> \be  									" 打开树状文件目录  
map <F5> :call CompileRunGcc()<CR>					" C，C++ 按F5编译运行
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc

map <F8> :call Rungdb()<CR> 						" C,C++的调试
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread 										" 设置当文件被改动时自动载入
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr> 		
													" quickfix模式
set completeopt=preview,menu  						" 代码补全 
filetype plugin on 									" 允许插件  
set clipboard+=unnamed  							" 共享剪贴板  
set nobackup 										" 从不备份  
:set makeprg=g++\ -Wall\ \ % 						" make 运行
set autowrite 										" 自动保存
"set ruler                  						" 打开状态栏标尺
set cursorline										" 突出显示当前行
set magic                   						" 设置魔术
set guioptions-=T           						" 隐藏工具栏
set guioptions-=m       							" 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
"set foldcolumn=0 									" 设置在状态行显示的信息
"set foldmethod=indent 
"set foldlevel=3 
"set foldenable              						" 开启折叠
set nocompatible 									" 不要使用vi的键盘模式，而是vim自己的
set syntax=on 										" 语法高亮
set noeb											" 去掉输入错误的提示声音
set confirm 										" 在处理未保存或只读文件的时候，弹出确认

set autoindent										" 自动缩进
set cindent
set tabstop=4 										" Tab键的宽度
set softtabstop=4 									" 统一缩进为4
set shiftwidth=4
set noexpandtab 									" 不要用空格代替制表符
set smarttab 										" 在行和段开始处使用制表符

set number											" 显示行号
set history=1000 									" 历史记录数
set nobackup 										" 禁止生成临时文件
set noswapfile

set ignorecase										" 搜索忽略大小写
set hlsearch 										" 搜索逐字符高亮
set incsearch
set gdefault 										" 行内替换
set enc=utf-8 										" 编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8 							" 语言设置
set helplang=cn

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
													" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

set laststatus=2 									" 总是显示状态行
set cmdheight=2 									" 命令行（在状态行下）的高度，默认为1，这里是2
filetype on 										" 侦测文件类型
filetype plugin on 									" 载入文件类型插件
filetype indent on 									" 为特定文件类型载入相关缩进文件
set viminfo+=!	 									" 保存全局变量
set iskeyword+=_,$,@,%,#,- 							" 带有如下符号的单词不要被换行分割
set linespace=0 									" 字符间插入的像素行数目
set wildmenu 										" 增强模式中的命令行自动完成操作
set backspace=2 									" 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l 								" 允许backspace和光标键跨越行边界

if has('mouse') 									" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
	set mouse=a
endif

set selection=exclusive
set selectmode=mouse,key
set report=0 										" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\				" 在被分割的窗口间显示空白，便于阅读
set showmatch										" 高亮显示匹配的括号
set matchtime=1 									" 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3 									" 光标移动到buffer的顶部和底部时保持3行距离
set smartindent 									" 为C程序提供自动缩进
au BufRead,BufNewFile *  setfiletype txt 			" 高亮显示普通txt文件（需要txt.vim脚本）

set showmatch										" 高亮显示匹配的括号


":inoremap ( ()<ESC>i 								" 自动补全
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
"function! ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endfunction


filetype plugin indent on  							" 打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  插件相关设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""#####################################
"NERDtree设定
""#####################################
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeDirArrows=0
nnoremap f :NERDTreeToggle
map <F7> :NERDTree<CR>  


""#####################################
"设定python自动缩进
""#####################################
autocmd FileType python setlocal et sta sw=4 sts=4

