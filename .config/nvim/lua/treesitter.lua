local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'hcl',
    'html',
    'java',
    'javascript',
    'json',
    'nix',
    'regex',
    'toml',
    'yaml'
  },
  highlight = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {enable = true},
}
