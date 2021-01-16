"---- vim-plug setup  ----
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----

set nocompatible

call plug#begin('~/.config/nvim/plugged')

" Sensible default
Plug 'tpope/vim-sensible'

" Color schemes
Plug 'sainnhe/edge'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" File explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'glepnir/galaxyline.nvim'

" Debugging
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'

" Search highglighting
Plug 'junegunn/vim-slash'

" Documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Cheatsheet
Plug 'dbeniamine/cheat.sh-vim'

" Github integration
Plug 'pwntester/octo.nvim'

" Testing
Plug 'vim-test/vim-test'

" Alignment
Plug 'junegunn/vim-easy-align'

" Motion
Plug 'easymotion/vim-easymotion'

" Comment
Plug 'cometsong/CommentFrame.vim'

" Split join
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

nnoremap <Space>v :e ~/.config/nvim/init.exp2.vim<CR>
nnoremap <leader>e !!$SHELL<CR>

source $HOME/.config/nvim/plugin-config/colors.vim
source $HOME/.config/nvim/plugin-config/lsp.vim
source $HOME/.config/nvim/plugin-config/treesitter.vim
source $HOME/.config/nvim/plugin-config/telescope.vim
source $HOME/.config/nvim/plugin-config/nvim-tree.vim
luafile $HOME/.config/nvim/plugin-config/eviline.lua
source $HOME/.config/nvim/plugin-config/dap.vim
source $HOME/.config/nvim/plugin-config/doge.vim
source $HOME/.config/nvim/plugin-config/test.vim
source $HOME/.config/nvim/plugin-config/easyalign.vim
source $HOME/.config/nvim/plugin-config/easymotion.vim
