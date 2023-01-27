local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('yaml_schema')
telescope.extensions.git_worktree.create = function()
  builtin.git_worktree({
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<c-d>', function()
        local selection = require('telescope.actions.state').get_selected_entry()
        local worktree = selection.value
        local worktree_path = selection.path
        local worktree_name = vim.fn.fnamemodify(worktree_path, ':t')
        local worktree_branch = vim.fn.system('git -C ' .. worktree_path .. ' branch --show-current')
        local worktree_status = vim.fn.system('git -C ' .. worktree_path .. ' status --porcelain')
        local worktree_status_clean = worktree_status == ''

        if worktree_status_clean then
          vim.cmd('cd ' .. worktree_path)
          vim.cmd('silent! edit')
          require('telescope.actions').close(prompt_bufnr)
        else
          local confirm = vim.fn.input('Worktree ' .. worktree_name .. ' has uncommitted changes. Continue? [y/N] ')
          if confirm == 'y' then
            vim.cmd('cd ' .. worktree_path)
            vim.cmd('silent! edit')
            require('telescope.actions').close(prompt_bufnr)
          end
        end
      end)
      return true
    end
  })
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>fy', ':Telescope yaml_schema<CR>', {silent = true})
