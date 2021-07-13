local utils = require('utils')

vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1
utils.create_augroup({
  {'BufRead,BufNewFile', '*.hcl', 'set', 'filetype=terraform'}
}, 'terraform')

