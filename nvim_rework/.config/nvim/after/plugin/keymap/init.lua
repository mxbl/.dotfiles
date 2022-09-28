local nnoremap = require("mx.keymap").nnoremap
local vnoremap = require("mx.keymap").vnoremap

-- FIXME:
vnoremap("F", function()
    require("mx.lsp.rust.formating").range_formatting()
end)

nnoremap("<leader>pv", ":Ex<CR>")

