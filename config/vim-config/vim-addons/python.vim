" python
augroup pythonsupport
  autocmd!

  let g:python3_host_prog = '~/miniconda3/bin/python'

  " autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 " colorcolumn=79
      " \ formatoptions+=croq softtabstop=4
      " \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

  if has('nvim')
    autocmd FileType python map <buffer> <F9> :update<CR>:sp term://nodemon -e py %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:update<CR>:sp term://nodemon -e py %<CR>
  else
    autocmd FileType python map <buffer> <F9> :update<CR>:term nodemon -e py %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:update<CR>:term nodemon -e py %<CR>
  endif

  autocmd FileType python map <buffer> <leader>rr :update<CR>:exec '!python3' shellescape(@%, 1)<CR>
  autocmd FileType python map <buffer> <leader>rd :update<CR>:exec '!python3 -m pdb' shellescape(@%, 1)<CR>

augroup end
