" ale
let g:ale_disable_lsp=1
let g:airline#extensions#ale#enabled=1
let g:ale_lint_on_save=1
let g:ale_linters_explicit=1
let g:ale_linters = {
      \ 'markdown': ['writegood']
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \}

