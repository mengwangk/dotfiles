augroup javasupport
	autocmd!
	autocmd FileType java compiler javac
	au Filetype java setlocal makeprg=javac\ %\ -g
	au Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
	au FileType java noremap <buffer> <leader>c <Esc>:w<cr>:make<cr>:cwindow<cr>
	au FileType java noremap <buffer> <leader>r :!clear;echo;echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end
