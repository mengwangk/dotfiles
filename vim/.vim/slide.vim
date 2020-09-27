" https://github.com/sdaschner/dotfiles/blob/master/.vimrc

augroup slidesupport
	autocmd!
	autocmd BufNewFile,BufRead *.slide set filetype=slide

	" presentation mode
	au Filetype slide noremap <buffer> <Left> :silent bp<CR> :redraw!<CR>
	au Filetype slide noremap <buffer> <Right> :silent bn<CR> :redraw!<CR>
	au Filetype slide nmap <buffer> <F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<CR>
	au Filetype slide nmap <buffer> <F2> :call DisplayPresentationBoundaries()<CR>
	au Filetype slide nmap <buffer> <F3> :call FindExecuteCommand()<CR>

	" jump to slides
	au Filetype slide nmap <buffer> <F9> :call JumpFirstBuffer()<CR> :redraw!<CR>
	au Filetype slide nmap <buffer> <F10> :call JumpSecondToLastBuffer()<CR> :redraw!<CR>
	au Filetype slide nmap <buffer> <F11> :call JumpLastBuffer()<CR> :redraw!<CR>

	" makes Ascii art font
	au Filetype slide nmap <buffer> <leader>F :.!toilet -w 200 -f standard<CR>
	au Filetype slide nmap <buffer> <leader>f :.!toilet -w 200 -f small<CR>

	" makes Ascii border
	au Filetype slide nmap <buffer> <leader>1 :.!toilet -w 200 -f term -F border<CR>

	let g:presentationBoundsDisplayed = 0
	function! DisplayPresentationBoundaries()
		if g:presentationBoundsDisplayed
			match
			set colorcolumn=0
			let g:presentationBoundsDisplayed = 0
		else
			highlight lastoflines ctermbg=darkred guibg=darkred
			match lastoflines /\%23l/
			set colorcolumn=80
			let g:presentationBoundsDisplayed = 1
		endif
	endfunction

augroup end
