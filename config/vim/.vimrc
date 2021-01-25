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
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-dadbod'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'
Plug 'vim-test/vim-test'

" Plug 'editorconfig/editorconfig'
Plug 'alvan/vim-closetag'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'konfekt/fastfold'
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'

Plug 'pechorin/any-jump.vim'
Plug 'unblevable/quick-scope'
Plug 'easymotion/vim-easymotion'
Plug 'dyng/ctrlsf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'kshenoy/vim-signature'

Plug 'gruvbox-community/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/gruvbox-material'
" Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'

" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'mzlogin/vim-markdown-toc'

Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'szw/vim-maximizer'

if has('nvim')
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END
else
  Plug 'machakann/vim-highlightedyank'
endif

" Plug 't9md/vim-choosewin'
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
" Plug 'puremourning/vimspector'
" Plug 'kien/ctrlp.vim'
" Plug 'preservim/nerdtree'
" Plug 'christoomey/vim-titlecase'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'

call plug#end()


" ------- plugins config -------------------------------
source $HOME/.config/nvim/plugin-config/mappings.vim
source $HOME/.config/nvim/plugin-config/gruvbox.vim
source $HOME/.config/nvim/plugin-config/airline.vim
source $HOME/.config/nvim/plugin-config/ale.vim
source $HOME/.config/nvim/plugin-config/startify.vim
source $HOME/.config/nvim/plugin-config/fzf.vim
source $HOME/.config/nvim/plugin-config/test.vim
source $HOME/.config/nvim/plugin-config/easyalign.vim
source $HOME/.config/nvim/plugin-config/ctrsf.vim
source $HOME/.config/nvim/plugin-config/floaterm.vim
source $HOME/.config/nvim/plugin-config/easymotion.vim
source $HOME/.config/nvim/plugin-config/quickscope.vim
source $HOME/.config/nvim/plugin-config/whichkey.vim
source $HOME/.config/nvim/plugin-config/doge.vim
source $HOME/.config/nvim/plugin-config/vimspector.vim
source $HOME/.config/nvim/plugin-config/coc.vim
source $HOME/.config/nvim/plugin-config/rust.vim
source $HOME/.config/nvim/plugin-config/python.vim
" source $HOME/.config/nvim/plugin-config/go.vim
" source $HOME/.config/nvim/plugin-config/ultisnips.vim
" source $HOME/.config/nvim/plugin-config/editorconfig.vim
" call SourceIfExists("$HOME/.config/nvim/plugin-config/org-mode.vim")
" call SourceIfExists("$HOME/.config/nvim/plugin-config/boxes.vim")
" call SourceIfExists("$HOME/.config/nvim/plugin-config/slide.vim")
" call SourceIfExists("$HOME/.config/nvim/plugin-config/java.vim")
