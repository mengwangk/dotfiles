set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim' 
Plugin 'powerline/powerline'

" let Vundle manage Vundle, required
" Plugin 'tmhedberg/SimpylFold'
" let g:SimpylFold_docstring_preview=1

"Plugin 'gmarik/Vundle.vim'
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'fatih/vim-go'
"Plugin 'jeetsukumaran/vim-indentwise'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'rust-lang/rust.vim'
"Plugin 'majutsushi/tagbar'
" Auto complete
"Plugin 'roxma/nvim-yarp'
"Plugin 'ncm2/ncm2'

" Fast python completion (use ncm2 if you want type info or snippet support)
" Plugin 'HansPinckaers/ncm2-jedi'
" Words in buffer completion
" Plugin 'ncm2/ncm2-bufword'
" Filepath completion
" Plugin 'ncm2/ncm2-path'

" Plugin 'davidhalter/jedi-vim'   " jedi for python

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

set encoding=utf-8
set clipboard=unnamed
set ts=4

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"set splitbelow
"set splitright

" Enable folding
"set foldmethod=indent
"set foldlevel=99

" Enable folding with the spacebar
"nnoremap <space> za

"let python_highlight_all=1
"syntax on

"set background=dark

"call togglebg#map("<F5>")

"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"set nu
"set pastetoggle=<F2>

"map <silent> <C-n> :NERDTreeToggle<CR>

"let g:rustfmt_autosave = 1

"autocmd vimenter * NERDTree
