local rt = require('rust-tools')

rt.setup({
    server = {
        on_attach = function (_, bufnr)
            vim.keymap.set_keymap('n', '<C-Space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set_keymap('n', '<leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
        end
    }
})
