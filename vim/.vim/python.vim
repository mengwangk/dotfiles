" python
augroup pythonsupport
  autocmd!
  if has('nvim')
    autocmd FileType python map <buffer> <F9> :w<CR>:sp term://nodemon -e py %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:sp term://nodemon -e py %<CR>
  else
    autocmd FileType python map <buffer> <F9> :w<CR>:term nodemon -e py %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:term nodemon -e py %<CR>
  endif
  autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
augroup end
