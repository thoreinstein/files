vim.keymap.set('n', 'gh',  ':Lspsaga lsp_finder<CR>')
vim.keymap.set('n', 'ga',  ':Lspsaga code_action<CR>')
vim.keymap.set('n', 'K ',  ':Lspsaga hover_doc<CR>')
vim.keymap.set('n', 'gs',  ':Lspsaga signature_help<CR>')
vim.keymap.set('n', 'gr',  ':Lspsaga rename<CR>')
vim.keymap.set('n', 'gd',  ':Lspsaga preview_definition<CR>')
vim.keymap.set('n', 'gf',  vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gm',  vim.lsp.buf.format, {})
