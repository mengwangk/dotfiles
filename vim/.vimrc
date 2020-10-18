set nocompatible

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
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
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'vim-test/vim-test'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'editorconfig/editorconfig'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'konfekt/fastfold'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'

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
Plug 'sainnhe/gruvbox-material'

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mzlogin/vim-markdown-toc'

Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'

" Plug 'justinmk/vim-sneak'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'lervag/vimtex'
" Plug 'metakirby5/codi.vim'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'vimwiki/vimwiki'
" Plug 'AndrewRadev/splitjoin'
" Plug 'ludovicchabant/vim-gutentags'
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

" Function to source only if file exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

syntax enable
filetype plugin indent on

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
set noswapfile
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
set undofile
set undodir=~/.vimdid

" utf-8 settings
set fileencoding=utf-8
set fileencodings=utf-8
set guifont=Monaco:h11
set guifontwide=NSimsun:h12

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

" terminal
if has('nvim')
  " tnoremap <Esc> <C-\><C-n>
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
endif
nnoremap <Space>w :update<CR>
nnoremap <Space>q :q<CR>
nnoremap <C-l> :nohl<CR>
inoremap jk <Esc>
nnoremap <leader>gc :GBranches<CR>
nnoremap <Space>g :Gstatus<CR>
nnoremap <Space>d :Gvdiffsplit<CR>
vmap < <gv
vmap > >gv
vnoremap X "_d
vnoremap p "_dP
autocmd BufWritePre * :call TrimWhitespace()
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <M-left> <C-w>>
nnoremap <silent> <M-right> <C-w><
nnoremap <silent> <M-up> <C-w>+
nnoremap <silent> <M-down> <C-w>-
nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> <M-l> :wincmd l<CR>
nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> <M-j> :wincmd j<CR>
nnoremap <silent> <M-s> :split<CR>
nnoremap <silent> <M-v> :vsplit<CR>
nnoremap <silent> ,h :wincmd h<CR>
nnoremap <silent> ,l :wincmd l<CR>
nnoremap <silent> ,k :wincmd k<CR>
nnoremap <silent> ,j :wincmd j<CR>
nnoremap <silent> ,s :split<CR>
nnoremap <silent> ,v :vsplit<CR>

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" https://thoughtbot.com/blog/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

" ------- plugins config -------------------------------

" airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=0
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#ignore_bufadd_pat='defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

" ale
let g:ale_disable_lsp=1
let g:airline#extensions#ale#enabled=1
let g:ale_lint_on_save=1
let g:ale_linters_explicit=1
let g:ale_linters = {
      \ 'markdown': ['writegood']
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \}

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
" let g:limelight_paragraph_span = 1
" let g:limelight_priority = -1

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
nnoremap <silent><nowait> <space>f  :Files<cr>

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
nmap <silent> <leader>tn :w<CR>:TestNearest<CR>
nmap <silent> <leader>tf :w<CR>:TestFile<CR>
nmap <silent> <leader>ts :w<CR>:TestSuite<CR>
nmap <silent> <leader>tl :w<CR>:TestLast<CR>
nmap <silent> <leader>tv :w<CR>:TestVisit<CR>
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
" let g:vimwiki_list = [{'path': '~/workspace/development/wiki-notes/wiki',
"       \ 'syntax': 'markdown', 'ext': '.wiki'}]
" let g:vimwiki_global_ext = 0

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" python-mode
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_cwindow = 0

" ctrsf
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" coc.nvim
call SourceIfExists("~/.vim/coc.vim")
let g:coc_global_extensions = [
      \ 'coc-python',
      \ 'coc-java',
      \ 'coc-go',
      \ 'coc-snippets',
      \ 'coc-marketplace',
      \ 'coc-prettier',
      \ 'coc-explorer',
      \ 'coc-highlight',
      \ 'coc-rls',
      \ 'coc-omni',
      \ 'coc-omnisharp',
      \ 'coc-tsserver',
      \ 'coc-json'
      \ ]
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" markdown
autocmd BufRead *.org set ft=markdown

" languages
call SourceIfExists("~/.vim/go.vim")
call SourceIfExists("~/.vim/rust.vim")
" call SourceIfExists("~/.vim/python.vim")
" call SourceIfExists("~/.vim/slide.vim")
" call SourceIfExists("~/.vim/java.vim")
