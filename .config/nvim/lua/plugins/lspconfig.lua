local lsp = require 'lspconfig'

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local on_attach = function(client)
    require'completion'.on_attach(client)
end

local sumneko_root_path = vim.fn.stdpath('data')..'/lspinstall/lua/sumneko-lua/extension/server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lsp.bashls.setup{}
lsp.dhall_lsp_server.setup{}
lsp.dockerls.setup{}
lsp.gopls.setup{}
lsp.hls.setup{}
lsp.java_language_server.setup{
    cmd= {'lang_server_mac.sh'}
}
lsp.jsonls.setup{}
lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})lsp.rnix.setup{}
lsp.terraformls.setup{}
lsp.tflint.setup{}
lsp.tsserver.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup{
    cmd = {'vscode-html-language-server', '--stdio'},
    capabilities = capabilities,
}
lsp.cssls.setup{}
lsp.tailwindcss.setup{}

