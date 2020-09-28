" python
augroup pythonsupport
  autocmd!
  if has('nvim')
    autocmd FileType python map <buffer> <F9> :update<CR>:sp term://nodemon -e py %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:update<CR>:sp term://nodemon -e py %<CR>
  else
    autocmd FileType python map <buffer> <F9> :update<CR>:term nodemon -e py %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:update<CR>:term nodemon -e py %<CR>
  endif
  autocmd FileType python map <buffer> <leader>r :update<CR>:exec '!python3' shellescape(@%, 1)<CR>
augroup end
