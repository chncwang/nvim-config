set nocompatible
set background=dark
set backspace=indent,eol,start
set expandtab
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set guifont=Monaco:h12
set helplang=en
set langmenu=en
set autoindent
set shiftwidth=4
set smartindent
set nocindent
set softtabstop=4
set termencoding=utf-8
set number
set ruler
set incsearch
set autowrite
set mouse=a
set nohlsearch

filetype plugin indent on
syntax on

nmap <C-s> :wall<CR>
nmap th <C-w>h
nmap tj <C-w>j
nmap tk <C-w>k
nmap tl <C-w>l
nmap tr <C-w><C-r>
nmap tn :tnext<CR>
nmap tp :tprevious<CR>
nmap tw <ESC><C-w>k:q<CR>
nmap ti :Nt<CR>

inoremap jj <Esc>

" set up vim-plug for neovim
call plug#begin('~/.config/nvim/plugged')

" file explorer
Plug 'preservim/nerdtree'

" quick edit
Plug 'hrp/EnhancedCommentify'
Plug 'terryma/vim-expand-region'

" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

" interface
Plug 'vim-airline/vim-airline'

" python
Plug 'python-mode/python-mode'

call plug#end()

" NERDTree
let g:NERDTree_title = "NERDTree"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1
let g:NERDChristmasTree = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeMouseMode = 1

command Nt NERDTree
