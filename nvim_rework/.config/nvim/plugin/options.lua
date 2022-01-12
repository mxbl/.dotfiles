vim.g.loaded_matchparen = 1

local opt = vim.opt

opt.belloff = "all"

-- Tabs / Indentation
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Long lines wrap smartly
opt.linebreak = true
opt.laststatus = 1
opt.autowriteall = true

opt.scrolloff = 7
opt.showmatch = true
opt.relativenumber = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false 
opt.backup = false
opt.undodir = "~/.nvim/undodir"
opt.inccommand = "split"

-- Share data between nvim sessions
opt.shada = {"!", "'1000", "<50", "s10", "h"}

-- floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmenu = true
opt.wildmode = "longest:full:list"
opt.wildoptions = "pum"

opt.ruler = false
opt.fillchars = { vert = "│", eob = "~" }
opt.list = true
opt.listchars = { tab = "▸ ", eol = "¬", space = "·", trail = "~" }

opt.colorcolumn = {80}
opt.cursorline = true

