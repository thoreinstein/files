nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> ga :Lspsaga code_action<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> gf :lua vim.lsp.buf.definition()<CR>
