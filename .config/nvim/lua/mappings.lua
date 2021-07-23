vim.g['mapleader'] = ' '

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal Mode Maps
map('n', '<leader>c', '"+y')
map('n', '<Space><Space>', '<cmd>:nohls<CR>')

-- LSP Maps
map('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>')
map('n', ']e', ':Lspsaga diagnostic_jump_next<CR>')
map('n', '<leader>ga', ':Lspsaga code_action<CR>')
map('n', '<leader>gd', ':Lspsaga preview_definition<CR>')
map('n', '<leader>gf', ':Lspsaga lsp_finder<CR>')
map('n', '<leader>gh', ':Lspsaga hover_doc<CR>')
map('n', '<leader>gr', ':Lspsaga rename<CR>')

-- Insert Mode Maps
map('i', 'jk', '<esc>')
map('i', '<C-u>', '<C-g>u<C-u>')
map('i', '<C-w>', '<C-g>u<C-w>')

map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

