set runtimepath^=~/.nvim runtimepath+=~/.nvim/after
let &packpath = &runtimepath

"---- vim-plug setup  ----
if has('nvim')
  let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
else
  let vimplug_exists=expand('~/.vim/autoload/plug.vim')
endif

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

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'rust-lang/rust.vim'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'sainnhe/edge'
Plug 'tweekmonster/startuptime.vim'
Plug 'mizlan/termbufm'
Plug 'mhinz/vim-signify'

Plug 'glepnir/galaxyline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript

"Plug 'Shougo/deol.nvim'
"Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
"if has('nvim')
"  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/denite.nvim'
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'Shougo/defx.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" programming
"Plug 'lambdalisue/gina.vim'
"Plug 'sheerun/vim-polyglot'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
"Plug 'Raimondi/delimitMate'
"Plug 'Yggdroot/indentLine'
"Plug 'severin-lemaignan/vim-minimap'
"Plug 'kshenoy/vim-signature'
"Plug 'vim-utils/vim-man'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'mattn/emmet-vim'
"Plug 'cohama/lexima.vim'
"Plug 't9md/vim-choosewin'
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'AndrewRadev/tagalong.vim'
"Plug 'alvan/vim-closetag'
"Plug 'kevinhwang91/rnvimr'
"Plug 'rhysd/git-messenger.vim'
"Plug 'liuchengxu/vista.vim'
"Plug 'romgrk/barbar.nvim'
"Plug 'wesQ3/vim-windowswap'
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'
"Plug 'turbio/bracey.vim'
"Plug 'mattn/vim-gist'


" colors
"Plug 'sainnhe/gruvbox-material'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"Plug 'christianchiarulli/nvcode-color-schemes.vim'
"Plug 'lifepillar/vim-gruvbox8'

" todo
"Plug 'vuciv/vim-bujo'
"Plug 'takac/vim-hardtime'

" motion
" Plug 'justinmk/vim-sneak'


" plugin development
" Plug '$HOME/workspace/development/vim-plugins/nvim-recent'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

if has('termguicolors')
  set termguicolors
endif
let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme edge

" terminal
syntax enable
filetype plugin indent on

set nu rnu
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set expandtab
set smartindent
set tabstop=4 softtabstop=4
set termguicolors
set cmdheight=2
set updatetime=50
set signcolumn=yes
vnoremap p "_dP

nnoremap <Space>v :e ~/.config/nvim/init.exp.vim<CR>
nnoremap <Space>c :Clap<CR>
nnoremap <Space>f <cmd>lua require'telescope.builtin'.find_files{ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } }<CR>
nnoremap <Space>g :lua require('telescope.builtin').git_files()<CR>
nnoremap <Space>s :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent> <Space> :WhichKey '<Space>'<CR>
nnoremap <silent> <Leader> :WhichKey '<Leader>'<CR>
"nnoremap <C-w-o> :MaximizerToggle!<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

:lua << EOF
  local nvim_lsp = require('nvim_lsp')
  local on_attach = function(_, bufnr)
    require('diagnostic').on_attach()
    require('completion').on_attach()
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  end
  local servers = {'gopls', 'rust_analyzer', 'pyls_ms', 'vimls','tsserver', 'cssls', 'html'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

:lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      disable = { },
    },
  }
EOF

luafile $HOME/.nvim/lua/eviline.lua

"let g:which_key_map['\<Space>'] = {
"      \ 'name' : '+windows' ,
"      \ 'x' : [':Clap'     , 'other-window'] ,
"      \ }

"lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
"autocmd BufEnter * lua require'completion'.on_attach()

"nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
"lua << EOF
"local on_attach_vim = function(client)
"  require'completion'.on_attach(client)
"  require'diagnostic'.on_attach(client)
"end
"require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
"EOF
"autocmd BufEnter,BufWinEnter,TabEnter *.go :lua require'lsp_extensions'.inlay_hints{}


"nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
"nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
"nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
"nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
"nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

"let g:hardtime_default_on = 1
"let g:hardtime_timeout = 5000
"let g:hardtime_showmsg = 1

" colors
"colorscheme gruvbox-material
"colorscheme gruvbox8
"set background=dark

" todo
"nmap <C-S> <Plug>BujoAddnormal
"imap <C-S> <Plug>BujoAddinsert
"nmap <C-Q> <Plug>BujoChecknormal
"imap <C-Q> <Plug>BujoCheckinsert
"let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" deoplete
"let g:deoplete#enable_at_startup = 1

" tagbar
"nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>

" IndentLine
"let g:indentLine_enabled = 1
"let g:indentLine_concealcursor = 0
"let g:indentLine_char = '┆'
"let g:indentLine_faster = 1

"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
"  nnoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action')
"  nnoremap <silent><buffer><expr> d
"  \ denite#do_map('do_action', 'delete')
"  nnoremap <silent><buffer><expr> p
"  \ denite#do_map('do_action', 'preview')
"  nnoremap <silent><buffer><expr> q
"  \ denite#do_map('quit')
"  nnoremap <silent><buffer><expr> i
"  \ denite#do_map('open_filter_buffer')
"  nnoremap <silent><buffer><expr> <Space>
"  \ denite#do_map('toggle_select').'j'
"endfunction

" choosewin
" nmap  -  <Plug>(choosewin)

" polyglot
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_format_strings = 1
"let g:go_highlight_variable_declarations = 1
"let g:go_auto_sameids = 1
