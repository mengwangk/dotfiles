" https://github.com/sdaschner/dotfiles/blob/master/.vimrc

augroup slidesupport
	autocmd!
	autocmd BufNewFile,BufRead *.slide set filetype=slide

	" presentation mode
	au Filetype slide noremap <buffer> <Left> :silent bp<CR> :redraw!<CR>
	au Filetype slide nnoremap <buffer> <Right> :silent bn<CR> :redraw!<CR>
	au Filetype slide nnmap <buffer> <F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<CR>
	au Filetype slide nnmap <buffer> <F2> :call DisplayPresentationBoundaries()<CR>
	au Filetype slide nnmap <buffer> <F3> :call FindExecuteCommand()<CR>au Filetype java setlocal makeprg=javac\ %\ -g

augroup end
