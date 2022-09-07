if not pcall(require, 'colorbuddy') then
    return
end

vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
require('colorbuddy').colorscheme 'tokyonight'

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new('darkgray', "#3a3a3a")
Color.new('darkgray1', "#0e0e1a")
Color.new('darkgray2', "#404040")
Color.new('lightblue', "#5eacd3")
Color.new('lime', "#bfff00")

Group.new("SignColumn", nil, nil, nil)
--Group.new("LineNr", colors.lightblue, nil, nil)
Group.new("LineNr", colors.darkgray, nil, styles.bold)
Group.new("Comment", colors.lightblue, nil, nil)
Group.new("NonText", colors.darkgray, nil, nil)
Group.new("Whitespace", colors.darkgray, nil, nil)
Group.new("Vertsplit", colors.darkgray, nil, nil)
Group.new("Normal", nil, nil, nil)
Group.new("NormalNC", nil, nil, nil)
Group.new('ErrorMsg', colors.red:light():light())
Group.new('Error', colors.red:light():light())
Group.new('ColorColumn', nil, colors.darkgray1)

-- Telescope
Group.new("TelescopeNormal", nil, nil, nil)
Group.new("TelescopeBorder", colors.lightblue, nil, nil)
Group.new("TelescopeTitle", colors.lightblue, nil, nil)

-- Treesitter
Group.new("TSKeywordReturn", colors.lime, nil, nil)
Group.new("TSKeyword", colors.lime, nil, nil)

-- Gitgutter
Group.new('GitGutterAdd', colors.darkgreen, nil, nil)
Group.new('GitGutterChange', colors.darkyellow, nil, nil)
Group.new('GitGutterDelete', colors.darkred, nil, nil)

Group.new('DiagnosticVirtualTextError', colors.red:light(), nil, nil)
--vim.api.nvim_command('hi link DiagnosticVirtualTextError DiagnosticError')

-- Neogit
Group.new('NeogitDiffAddHighlight', colors.red:light(), colors.darkgray2, nil)
Group.new('NeogitDiffAddRegion', colors.red:light(), colors.darkgray2, nil)

