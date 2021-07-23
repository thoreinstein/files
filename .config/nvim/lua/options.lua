local opt = vim.opt

vim.cmd([[
    syntax off
    filetype off
    filetype plugin indent off
]])

opt.shadafile = "NONE"
vim.o.termguicolors = true
opt.shell = "/run/current-system/sw/bin/zsh"
opt.number = true
opt.backspace = 'indent,eol,start'
opt.showcmd = true
opt.splitbelow = true
opt.splitright = true
opt.encoding = 'utf-8'
opt.autowrite = true
opt.autoread = true
opt.laststatus = 2
opt.hidden = true
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.conceallevel = 0
opt.wrap = true
opt.textwidth = 80
opt.formatoptions = 'qrn1'
opt.autoindent = true
opt.smartindent = true
vim.cmd[[set complete-=i]]
opt.showmatch = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.shiftround = true
vim.cmd[[set nrformats-=octal]]
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.complete = ',w,b,u,t'
opt.completeopt = 'menuone,noinsert,noselect'
opt.scrolloff = 1
opt.sidescrolloff = 5
opt.wildmode = 'longest,list,full'
vim.cmd [[set wildignore+=.hg,.git,.svn]]
vim.cmd [[set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg]]
vim.cmd [[set wildignore+=*.sw?]]
vim.cmd [[set wildignore+=*.DS_Store]]
vim.cmd [[set wildignore+=go/pkg]]
vim.cmd [[set wildignore+=go/bin]]

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
