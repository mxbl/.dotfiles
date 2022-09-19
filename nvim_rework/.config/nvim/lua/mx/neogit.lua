local neogit = require('neogit')
local nnoremap = require('mx.keymap').nnoremap

neogit.setup {
    disable_context_highlighting = false,
}

nnoremap("<leader>gs", function()
    neogit.open({})
end);
