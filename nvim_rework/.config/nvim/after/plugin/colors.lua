if not pcall(require, 'colorbuddy') then
    return
end

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
require('colorbuddy').colorscheme 'gruvbuddy'
require('colorizer').setup()

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new('darkgray', "#3a3a3a")
Color.new('darkgray1', "#0e0e1a")
Color.new('darkgray2', "#404040")
Color.new('lightblue', "#5eacd3")
Color.new('diagnostic_error', "#db4b4b")
Color.new('diagnostic_warn', "#e0af68")
Color.new('diagnostic_info', "#0db9d7")
Color.new('diagnostic_hint', "#1abc9c")
Color.new('netrwDir', "#5eacd3")
--Color.new('lime', "#bfff00")
--Color.new('purple', "#9d7cd8")
--Color.new('comment', "#565f89")

Group.new("SignColumn", nil, nil, nil)
Group.new("LineNr", colors.darkgray2, nil, styles.bold)
--Group.new("LineNr", colors.darkgray, nil, styles.bold)
Group.new("Comment", colors.darkgray2, nil, nil)
--Group.new("NonText", colors.darkgray, nil, nil)
Group.new("Whitespace", colors.darkgray, nil, nil)
Group.new("Vertsplit", colors.darkgray, nil, nil)
Group.new("Normal", nil, nil, nil)
Group.new("NormalNC", nil, nil, nil)
Group.new('ErrorMsg', colors.red:light():light())
Group.new('Error', colors.red:light():light())
--Group.new('ColorColumn', nil, colors.darkgray1)

-- Telescope
Group.new("TelescopeNormal", nil, nil, nil)
Group.new("TelescopeBorder", colors.lightblue, nil, nil)
Group.new("TelescopeTitle", colors.lightblue, nil, nil)

-- Gitgutter
Group.new('GitGutterAdd', colors.darkgreen, nil, nil)
Group.new('GitGutterChange', colors.darkyellow, nil, nil)
Group.new('GitGutterDelete', colors.darkred, nil, nil)

Group.new('DiagnosticVirtualTextError', colors.diagnostic_error, nil, nil)
Group.new('DiagnosticVirtualTextWarn', colors.diagnostic_warn, nil, nil)
Group.new('DiagnosticVirtualTextInfo', colors.diagnostic_info, nil, nil)
Group.new('DiagnosticVirtualTextHint', colors.diagnostic_hint, nil, nil)

Group.new('netrwDir', colors.netrwDir, nil, nil)
