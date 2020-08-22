set nocompatible

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'pechorin/any-jump.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'unblevable/quick-scope'       
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'konfekt/fastfold'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/gv.vim'

" Plug 'puremourning/vimspector'
" Plug 'kien/ctrlp.vim' 
" Plug 'preservim/nerdtree'
" Plug 'christoomey/vim-titlecase'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

call plug#end()

syntax enable
filetype plugin indent on

set encoding=utf-8
set clipboard=unnamed
set relativenumber
set number
set number relativenumber
set ignorecase
set autoindent
set smartindent
set showcmd
set noswapfile
set incsearch
set pyxversion=3	" Python 3 neovim
set smarttab		" tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4		" the visible width of tabs
set softtabstop=4	" edit as if the tabs are 4 characters wide 
set shiftwidth=4	" number of spaces to use for indent and unindent
set shiftround		" round indent to a multiple of 'shiftwidth'
set splitright
set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set cursorline

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

" set colorcolumn=80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" syntastic syntax checker
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'lineinfo', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
	  \   'lineinfo': "LineInfo",
      \ },
      \ }
function! LineInfo()
  return line('.') . '/' . line('$')
endfunction

" gruvbox
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
	set t_8f=^[[38;2;%lu;%lu;%lum
	set t_8b=^[[48;2;%lu;%lu;%lum
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark cursorline termguicolors

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
let g:limelight_priority = -1

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <silent><nowait> <space>f  :<C-u>Files<cr>

" fzf checkout
nnoremap <leader>gc :GCheckout<CR>

" startify
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'b': '~/.bashrc' },
            \ { 'v': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ ]

" avoid the <ESC>?

" Function to source only if file exists 
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" Source coc file
call SourceIfExists("~/.vim/coc.vim")

" https://thoughtbot.com/blog/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

" Osc52Yank?
