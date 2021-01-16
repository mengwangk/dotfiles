syntax enable
filetype plugin indent on

set exrc
set hidden
set encoding=utf-8
set visualbell
set clipboard=unnamed,unnamedplus
set relativenumber
set number
set number relativenumber
set ignorecase smartcase
set autoindent smartindent
set showcmd
set noshowmode
set incsearch
set pyxversion=3
set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4 shiftround
set splitright splitbelow
set statusline=%#warningmsg#
set statusline+=%*
set laststatus=2
set cursorline
set textwidth=100
set pastetoggle=<F2>
set mouse=a
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vimdid
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set complete+=t
set spell
set scrolloff=8
set cmdheight=2
set updatetime=50

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

set fileencoding=utf-8

if exists('+termguicolors')
  set t_8f=[38;2;%lu;%lu;%lum " Use <Ctr-V><Esc> for actual escape
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif

" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/debug/**
set wildignore+=**/target/**
set wildignore+=**/bin/**
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Display all matching files when we tab complete
set wildmenu
if has("wildmenu")
  set wildmenu
  set wildmode=longest,list
endif

" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" color column
highlight ColorColumn ctermbg=lightcyan guibg=blue
call matchadd('ColorColumn', '\%101v\s*\zs\S', 120)

" https://thoughtbot.com/blog/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72
