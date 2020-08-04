set nocompatible

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'

" Plug 'kien/ctrlp.vim' 

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'christoomey/vim-titlecase'

" Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'vim-syntastic/syntastic'

Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Go language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Initialize plugin system
call plug#end()

syntax enable
filetype plugin indent on

" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim 
" Search down into subfolders
" Provides tab-completion for all file-related tasks
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

set encoding=utf-8
set clipboard=unnamed
set relativenumber
set ignorecase
set autoindent
set smartindent
set showcmd
set noswapfile
set incsearch
" set termwinsize=10x0
" set termguicolors

"Cursor settings:
"
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

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
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$|pkg$|bin\|target\|debug$',
"   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
"   \ }

" fzf 
map <C-p> :Files<CR>
" nnoremap <C-p> :<C-u>FZF<CR> 

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"
set splitright

set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic syntax checker
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='simple'
"
" lightline
set laststatus=2
set noshowmode

" Color scheme
colorscheme gruvbox
set background=dark
" set bg=dark
" hi Pmenu ctermbg=black ctermfg=white

" Column marker
" set colorcolumn=80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" netrw
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize = 25
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

"autocmd vimenter * NERDTree

" function! Osc52Yank()
"     let buffer=system('base64 -w0', @0)
"     let buffer=substitute(buffer, "\n$", "", "")
"     let buffer='\e]52;c;'.buffer.'\x07'
"     silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/pts/0")
" endfunction
" command! Osc52CopyYank call Osc52Yank()
" augroup Example
"     autocmd!
"     autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
" augroup END

"  Map key for .vimrc
map <leader>vimrc :tabe ~/.vimrc<cr>

" Function to source only if file exists 
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" Source coc file
call SourceIfExists("~/.vim/coc.vim")

" Source .vimrc automatically
autocmd bufwritepost .vimrc source $MYVIMRC
