local saga = require "lspsaga"
local sumneko_root_path = vim.env.HOME .. '/src/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'

local function on_attach()
end

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

require'lspconfig'.tsserver.setup{
	on_attach=on_attach
}

require'lspconfig'.yamlls.setup{
	on_attach=on_attach
}

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- require'lspconfig'.rnix.setup{
-- 	on_attach=on_attach
-- }

-- require('jdtls').start_or_attach({cmd = {'jdtls'}})
 require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }

saga.init_lsp_saga()
