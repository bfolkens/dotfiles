-- augroup Neofmt
--   autocmd!
--   autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
-- augroup END

-- vim.g.neoformat_verbose = 1
vim.g.neoformat_only_msg_on_error = 1
