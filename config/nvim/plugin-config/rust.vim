" rust
augroup rustsupport
  autocmd!
  autocmd FileType rust map <buffer> <leader>rr :update<CR>:RustRun<CR>
  autocmd FileType rust map <buffer> <leader>rc :update<CR>:Cargo run<CR>
  autocmd FileType rust packadd termdebug
augroup end
