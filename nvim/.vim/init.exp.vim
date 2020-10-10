set runtimepath^=~/.nvim runtimepath+=~/.nvim/after
let &packpath = &runtimepath

set nocompatible

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" programming
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-gutentags'

" neovim lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" colors
Plug 'sainnhe/gruvbox-material'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" todo
Plug 'vuciv/vim-bujo'

" motion
Plug 'justinmk/vim-sneak'

call plug#end()

" terminal
set nu rnu
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set expandtab
set smartindent
set tabstop=4 softtabstop=4
set termguicolors
set cmdheight=2
set updatetime=50
vnoremap p "_dP
nnoremap <leader>v :e ~/.config/nvim/init.exp.vim<CR>
" nnoremap <A-g> :GFiles<CR>

" colors
colorscheme gruvbox-material
set background=dark

" telescope
nnoremap <Space>f <cmd>lua require'telescope.builtin'.find_files{ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } }<CR>

" todo
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

"lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" polyglot
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
