" 定义快捷键的前缀，即<Leader>
let mapleader=" "

" 开启语义分析
syntax enable
syntax on

" 在插入模式下也能使用退格
set backspace=indent,eol,start

" kj 或者 vv 齐按退出插入模式
inoremap kj <esc>
inoremap vv <esc>

" 使用ctrlc, v就可以实现vim之间的复制粘贴
vnoremap <C-c> :w! ~/tmp/clipboard.txt <CR>
inoremap <C-v> <Esc>:r ~/tmp/clipboard.txt <CR>
" 文档全选
nnoremap <C-a> ggvG$
inoremap <C-a> <Esc>ggvG$

noremap U 5j
noremap E 5k
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

" 快速移动到行首，行尾
map <Leader>1 ^
map <Leader>0 $

" 配置常用键位映射
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" 分割窗口
map s[ :set nosplitright<CR>:vsplit<CR>
map s] :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" 空格 + l/k/j/h 跳转窗口
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h

" 空格 + ↑/↓/←/→ 调整窗口大小
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>


set number                " 显示行数
"set paste				  " 取消粘贴时带注释
set norelativenumber
set cursorline			  " 高亮显示当前行
set showcmd               " 显示不完全命令
set showmatch			  " 显示匹配括号
set wildmenu     		  " vim 自身命令行模式智能补全
set noswapfile     		  " 不产生.swp文件
set nobackup			  " 不生成备份文件
set history=1000		  " 历史记录数
set hlsearch              " 搜索关键词高亮
set noexpandtab 		  " 不要用空格代替制表符
exec "nohlsearch"
set incsearch             " 增量搜索
set ignorecase            " 设置默认大小写不敏感查找
set smartcase             " 如果有大小写字母，则切换到大小写敏感查找
set autoindent            " 自动缩进 
set ai                    " vim中复制粘贴保存格式
set shortmess=atI         " 启动的时候不显示那个援助乌干达儿童的提示

" 删除光标所在单词
nmap <LEADER>w daw
" 向下翻半屏
nmap <Leader>u <C-U>
" 向上翻半屏
nmap <Leader>d <C-D>
" 使用NERDTree插件打开文件树形结构列表
nmap <LEADER>n :NERDTreeToggle<CR>
" 使用TlistToggle查看文件函数列表
nnoremap  <Leader>m  :TlistToggle <CR>


"把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1 

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 根据侦测到的不同类型采用不同的缩进格式
filetype indent on


"花括号自动格式化，首行一个tab
autocmd FileType cpp,java inoremap { {<CR>}<ESC>kA<CR>
"括号匹配
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i


"======================代码补全配置=============================

" 添加自动补全字典
" au FileType php setlocal dict+=~/.vim/dictionary/php_keywords_list.txt
" au FileType cpp setlocal dict+=~/.vim/dictionary/cpp_keywords_list.txt
" au FileType java setlocal dict+=~/.vim/dictionary/java_keywords_list.txt
au FileType markdown setlocal dict+=~/.vim/dictionary/words.txt

" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'*':1}

" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b

" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c

"=====================代码补全配置==============================


call plug#begin('~/.vim/plugged')
" 底部文本信息
Plug 'vim-airline/vim-airline'

" 主题颜色
Plug 'connorholyday/vim-snazzy'

" 模糊查找
Plug 'Yggdroot/LeaderF'

" 括号自动补全，字符或字符串后自动补全特定字符
Plug 'jiangmiao/auto-pairs'

" 代码缩进标识
Plug 'Yggdroot/indentLine'

" 打开文件目录树形结构
Plug 'scrooloose/nerdtree'

" 代码补全插件
Plug 'skywind3000/vim-auto-popmenu'

" 编写文本文件和 markdown 的时候提供英文单词补全的字典
Plug 'skywind3000/vim-dict'

" 快速注释插件
Plug 'scrooloose/nerdcommenter'

call plug#end()

let g:SnazzyTransparent = 1
color snazzy

"===========================文件头部注释设置 start====================================

" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh,*.java,*.go exec ":call SetTitle()"
" 加入注释 
func SetComment()
        call setline(1,"/*================================================================")
        call append(line("."),   "*   Copyright (C) ".strftime("%Y")." IEucd Inc. All rights reserved.")
        call append(line(".")+1, "*   ")
        call append(line(".")+2, "*   FileName：".expand("%:t"))
        call append(line(".")+3, "*   Author：Colzry, colzry@163.com")
        call append(line(".")+4, "*   CreateDate：".strftime("%Y-%m-%d"))
        call append(line(".")+5, "*   Description：")
        call append(line(".")+6, "*")
        call append(line(".")+7, "================================================================*/")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
        call setline(3, "#================================================================")
        call setline(4, "#   Copyright (C) ".strftime("%Y")." IEucd Inc. All rights reserved.")
        call setline(5, "#   ")
        call setline(6, "#   FileName：".expand("%:t"))
        call setline(7, "#   Author：SongTL, colzry@163.com")
        call setline(8, "#   CreateDate：".strftime("%Y-%m-%d"))
        call setline(9, "#   Description：")
        call setline(10, "#")
        call setline(11, "#================================================================")
        call setline(12, "")
        call setline(13, "")
endfunc
" 定义函数SetTitle，自动插入文件头 
func SetTitle()
        if &filetype == 'make'
                call setline(1,"")
                call setline(2,"")
                call SetComment_sh()

        elseif &filetype == 'sh'
                call setline(1,"#!/system/bin/sh")
                call setline(2,"")
                call SetComment_sh()

        else
             call SetComment()
             if expand("%:e") == 'hpp'
                  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
                  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
                  call append(line(".")+12, "#ifdef __cplusplus")
                  call append(line(".")+13, "extern \"C\"")
                  call append(line(".")+14, "{")
                  call append(line(".")+15, "#endif")
                  call append(line(".")+16, "")
                  call append(line(".")+17, "#ifdef __cplusplus")
                  call append(line(".")+18, "}")
                  call append(line(".")+19, "#endif")
                  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H")

             elseif expand("%:e") == 'h'
                call append(line(".")+10, "#pragma once")
             elseif &filetype == 'c'
                call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
             elseif &filetype == 'cpp'
                call append(line(".")+10, "#include \"".expand("%:t:r").".h\"")
             endif
        endif
endfun

"===========================文件头部注释设置 end======================================
