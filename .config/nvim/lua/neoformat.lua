local utils = require('utils')

utils.create_augroup({
  {'BufWritePre', '*', 'undojoin', '|', 'Neoformat'}
}, 'neoformat')
vim.g['neoformat_enabled_javascript'] = { 'prettier' }

