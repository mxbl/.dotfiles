if not pcall(require, 'colorbuddy') then
	return
end

vim.opt.termguicolors = true

require('colorbuddy').colorscheme 'gruvbuddy'

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Group.new('Normal', nil, nil, nil)
Group.new('Comment', colors.gray, nil, nil)
