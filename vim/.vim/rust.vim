" rust
augroup rustsupport
  autocmd!
  autocmd FileType rust map <buffer> <leader>rr :RustRun<CR>
  autocmd FileType rust map <buffer> <leader>rc :Cargo run<CR>
augroup end
