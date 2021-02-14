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

" terminal
" tnoremap <Esc> <C-\><C-n>
nnoremap <C-w><C-o> :MaximizerToggle!<CR>
tnoremap <C-w><C-o> <C-\><C-n> :MaximizerToggle!<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap jk <C-\><C-n>
if has('nvim')
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * startinsert
endif

nnoremap <Space>w :update<CR>
nnoremap <Space>q :q<CR>
inoremap jk <Esc>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>s :CocSearch <C-R><C-W><CR>
nnoremap <Space>g :Gstatus<CR>
nnoremap <Space>d :Gvdiffsplit<CR>
nnoremap <Space>r :FloatermNew ranger<CR>
nnoremap <leader>e !!$SHELL<CR>
nnoremap <leader>v :vsplit $MYVIMRC<CR>
vmap < <gv
vmap > >gv
vnoremap X "_d
vnoremap p "_dp
vnoremap P "_dP
autocmd BufWritePre * :call TrimWhitespace()
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" nnoremap <Tab> gt  - conflict with <C-I> completion - https://www.reddit.com/r/vim/comments/3dauvp/i_cant_inoremap_tab_and_ci_to_different_things/
nnoremap <S-Tab> gT
nnoremap <silent> <M-left> <C-w>>
nnoremap <silent> <M-right> <C-w><
nnoremap <silent> <M-up> <C-w>+
nnoremap <silent> <M-down> <C-w>-
nnoremap <silent> ,h :wincmd h<CR>
nnoremap <silent> ,l :wincmd l<CR>
nnoremap <silent> ,k :wincmd k<CR>
nnoremap <silent> ,j :wincmd j<CR>
nnoremap <silent> ,s :split<CR>
nnoremap <silent> ,v :vsplit<CR>
nnoremap <silent> ,n :bn<CR>
nnoremap <silent> ,p :bp<CR>
nnoremap <silent> ,d :bd!<CR>
nnoremap <silent> ,b :.Gbrowse<CR>

if has('nvim')
  nnoremap <silent> ,t :15sp +term<CR>a
else
  nnoremap <silent> ,t :term ++rows=15<CR>
endif
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
