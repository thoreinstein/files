vim.opt.path:append('**')
vim.opt.wildmode = 'longest,full'
vim.opt.wildignore = {
    '.git',
    'node_modules',
}
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 1000
vim.opt.hidden = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({
    virtual_text = false,
})

vim.g.mapleader = ","
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
