set nocompatible

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dadbod'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-test/vim-test'

Plug 'editorconfig/editorconfig'
Plug 'alvan/vim-closetag'
Plug 'metakirby5/codi.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'konfekt/fastfold'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'

Plug 'pechorin/any-jump.vim'
Plug 'unblevable/quick-scope'       
Plug 'easymotion/vim-easymotion'
Plug 'dyng/ctrlsf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'vimwiki/vimwiki'
Plug 'mzlogin/vim-markdown-toc'

Plug 'mhinz/vim-startify'


" Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Plug 'tpope/vim-obsession'
" Plug 'junegunn/vim-emoji'
" Plug 'itchyny/lightline.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'vim-syntastic/syntastic'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'tpope/vim-endwise'
" Plug 'ryanoasis/vim-devicons'
" Plug 'puremourning/vimspector'
" Plug 'kien/ctrlp.vim' 
" Plug 'preservim/nerdtree'
" Plug 'christoomey/vim-titlecase'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'

call plug#end()

syntax enable
filetype plugin indent on

set encoding=utf-8
set visualbell
set clipboard=unnamed
set relativenumber
set number
set number relativenumber
set ignorecase smartcase
set autoindent smartindent
set showcmd
set noshowmode
set noswapfile
set incsearch
set pyxversion=3	
set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4 shiftround
set splitright splitbelow
set statusline=%#warningmsg#
set statusline+=%*
set laststatus=2
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

" python
if has('nvim')
	autocmd FileType python map <buffer> <F9> :w<CR>:sp term://nodemon -e py %<CR>
	autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:sp term://nodemon -e py %<CR>
else
	autocmd FileType python map <buffer> <F9> :w<CR>:term nodemon -e py %<CR>
	autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:term nodemon -e py %<CR>
endif
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" terminal 
if has('nvim')
	tnoremap <C-w>h <C-\><C-n><C-w>h
	tnoremap <C-w>j <C-\><C-n><C-w>j
	tnoremap <C-w>k <C-\><C-n><C-w>k
	tnoremap <C-w>l <C-\><C-n><C-w>l
endif
inoremap <C-s>  <C-O>:update<cr>

" airline
let g:airline_solarized_bg='dark'

" ale
let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1

" gruvbox
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
	set t_8f=[38;2;%lu;%lu;%lum " Use <Ctr-V><Esc> for actual escape
	set t_8b=[48;2;%lu;%lu;%lum
	set termguicolors
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark cursorline termguicolors

" limelight
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

" color column
highlight ColorColumn ctermbg=lightcyan guibg=blue
call matchadd('ColorColumn', '\%101v\s*\zs\S', 120)

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

" floaterm
nnoremap <silent><nowait> <space>t  :<C-u>FloatermNew<cr>

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
if has('nvim')
	let test#strategy = "neovim"
	let test#neovim#term_position = "belowright"
else
	let test#strategy = "vimterminal"
	let test#vim#term_position = "belowright"
endif

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" vimwiki
let g:vimwiki_list = [{'path': '~/workspace/development/wiki-notes/wiki',
			\ 'syntax': 'markdown', 'ext': '.wiki'}]
let g:vimwiki_global_ext = 0

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" python-mode
let g:pymode_options_colorcolumn = 0

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
