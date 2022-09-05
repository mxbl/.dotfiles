if not pcall(require, 'colorbuddy') then
  return
end

vim.opt.termguicolors = true

require('colorbuddy').colorscheme 'gruvbuddy'
require('colorizer').setup()

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new('darkgray0',  '#1c1c1c')
Color.new('darkgray1',  '#3a3a3a')
Color.new('somegreen1', '#33ff00')
Color.new('lightblue',  '#5eacd3')

Group.new('Normal',     nil, nil, nil)
Group.new('Comment',    colors.gray, nil, nil)
Group.new('Type',       colors.purple, nil, nil)
Group.new('NonText',    colors.darkgray1, nil, nil)
Group.new('Whitespace', colors.darkgray1, nil, nil)
Group.new('Vertsplit',  colors.darkgray1, nil, nil)
Group.new('LineNr',     colors.darkgray1, nil, nil)
Group.new('CursorLine', nil, colors.darkgray0, nil)
Group.new('Function',   colors.lightblue, nil, nil)
Group.new('Special',    colors.lightblue, nil, nil)
Group.new('Identifier', nil, nil, nil)
Group.new('Folded',     colors.somegreen1, nil, nil)

-- Lsp
Group.new('SignColumn', nil, nil, nil)

-- Telescope
Group.new('TelescopeTitle',  colors.lightblue, nil, nil)
Group.new('TelescopeBorder', colors.green, nil, nil)

-- Statusline
Group.new('StatuslineError1', colors.red:light():light(), groups.Statusline)
Group.new('StatuslineError2', colors.red:light(), groups.Statusline)
Group.new('StatuslineError3', colors.red, groups.Statusline)

Group.new('ErrorMsg', colors.red:light():light())
Group.new('Error',    colors.red:light():light())

-- Netrw
Group.new('netrwDir', colors.lightblue)

-- Notify
Group.new('NotifyINFOBorder', colors.darkgray0)
Group.new('NotifyINFOBody',   colors.gray)

-- Gitgutter
Group.new('GitGutterAdd',    colors.darkgreen, nil, nil)
Group.new('GitGutterChange', colors.darkyellow, nil, nil)
Group.new('GitGutterDelete', colors.darkred, nil, nil)

-- Bug: icon group highlights message body in minimal
--Group.new('NotifyINFOIcon', colors.gray)

--hi PMenu        guifg=#000000 guibg=#3a3a3a
--hi PMenuSel     guifg=#000000 guibg=#d7005f
--hi PMenuSbar    guifg=none    guibg=#3a3a3a
--hi PMenuThumb   guifg=none    guibg=#005f87
