require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	ignore_install = { "haskell" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
}
