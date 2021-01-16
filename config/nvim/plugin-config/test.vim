" Testing
nmap <silent> <leader>tn :w<CR>:TestNearest<CR>
nmap <silent> <leader>tf :w<CR>:TestFile<CR>
nmap <silent> <leader>ts :w<CR>:TestSuite<CR>
nmap <silent> <leader>tl :w<CR>:TestLast<CR>
nmap <silent> <leader>tv :w<CR>:TestVisit<CR>
if has('nvim')
  let test#strategy = "neovim"
  let test#neovim#term_position = "belowright"
else
  let test#strategy = "vimterminal"
  let test#vim#term_position = "belowright"
endif