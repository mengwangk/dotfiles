augroup javasupport
	autocmd!
	autocmd FileType java compiler javac
	au Filetype java setlocal makeprg=javac\ %\ -g
	au Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
	au FileType java noremap <buffer> <leader>m :make<cr>:copen<cr>
	au FileType java noremap <buffer> <leader>r :!echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end
