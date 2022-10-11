vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.shortmess:append "c"

local cmp = require "cmp"

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    sources = {
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
}
