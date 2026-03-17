" --- 基础设置 ---

" 开启文件类型检测、插件和缩进
filetype plugin indent on

" 开启语法高亮
syntax on

" --- 界面显示 ---
set number             " 显示绝对行号
set relativenumber     " 显示相对行号
set showmatch          " 高亮匹配的括号
set laststatus=2       " 总是显示状态栏
set ruler              " 在右下角显示光标位置

" --- 搜索设置 ---
set hlsearch           " 高亮搜索结果
set incsearch          " 输入时即时跳转
set ignorecase         " 搜索时忽略大小写
set smartcase          " 搜索中包含大写时自动切换为区分大小写

" --- 缩进与 Tab ---
set tabstop=4          " Tab 宽度为 4
set shiftwidth=4       " 自动缩进宽度为 4
set expandtab          " 将 Tab 转换为空格
set autoindent         " 继承前一行的缩进
set smartindent        " 开启智能缩进（例如输入 { 后回车自动缩进）

" --- 其他增强 ---
set backspace=indent,eol,start " 让退格键在 Insert 模式下符合现代逻辑
set mouse=

