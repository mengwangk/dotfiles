set nocompatible

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim' 

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'preservim/nerdtree'

" Plug 'christoomey/vim-titlecase'

Plug 'lifepillar/vim-solarized8'

Plug 'vim-syntastic/syntastic'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Go language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

syntax enable
filetype plugin indent on

set encoding=utf-8
set clipboard=unnamed
set relativenumber
set ignorecase
set autoindent

" Tab control
set smarttab		" tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4		" the visible width of tabs
set softtabstop=4	" edit as if the tabs are 4 characters wide 
set shiftwidth=4	" number of spaces to use for indent and unindent
set shiftround		" round indent to a multiple of 'shiftwidth'

" Map C-n to NerdTree
map <C-n> :NERDTreeToggle<CR>

" Ignored files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1

" CtrlP to search hidden files
let g:ctrlp_show_hidden = 1

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"set splitbelow
"set splitright

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic syntax checker
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline#extensions#tabline#enabled = 1

" Color scheme
set background=dark
colorscheme solarized8

"autocmd vimenter * NERDTree
