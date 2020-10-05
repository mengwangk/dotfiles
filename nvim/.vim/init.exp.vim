set runtimepath^=~/.nvim runtimepath+=~/.nvim/after
let &packpath = &runtimepath

set nocompatible

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'sainnhe/gruvbox-material'

call plug#end()

set nu rnu
vnoremap p "_dP
nnoremap <leader>v :e ~/.config/nvim/init.exp.vim<CR>

