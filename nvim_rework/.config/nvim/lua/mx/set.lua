vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false
vim.opt.showcmd = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000ms = 4s) leads to noticable
-- delays and poor user experience
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"

vim.opt.laststatus = 2
vim.opt.mouse = "a"
vim.opt.autowriteall = true

vim.opt.ruler = false
vim.opt.fillchars = { vert = "│", eob = "~" }
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", eol = "¬", space = "·", trail = "~" }
-- tab: "▸ "

vim.g.mapleader = " "

vim.cmd([[
    augroup InitAutoCommands
        au!
        au FileType conf,sh,tmux,xdefaults setlocal foldmethod=marker
    augroup END
]])
