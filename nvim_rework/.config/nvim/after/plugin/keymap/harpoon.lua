local nnoremap = require("mx.keymap").nnoremap

local silent = { silent = true }

nnoremap(",,a", function() require("harpoon.mark").add_file() end, silent)
nnoremap(",e", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap(",a", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap(",s", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap(",d", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap(",f", function() require("harpoon.ui").nav_file(4) end, silent)
