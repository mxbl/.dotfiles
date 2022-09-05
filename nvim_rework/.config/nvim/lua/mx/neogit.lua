local neogit = require('neogit')
local nnoremap = require('mx.keymap').nnoremap

neogit.setup {}

nnoremap("<leader>gs", function()
    neogit.open({})
end);
