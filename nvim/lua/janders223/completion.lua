vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.shortmess:append "c"

local cmp = require "cmp"
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

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

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
