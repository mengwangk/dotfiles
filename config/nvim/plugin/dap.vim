
" Debugging
" lua <<EOF
" require('telescope').load_extension('dap')
" require('dap-python').setup('~/miniconda3/bin/python')
" EOF
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <leader>dd :lua require('dap').continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>`
" nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
" vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
