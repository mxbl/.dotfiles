local nnoremap = require("mx.keymap").nnoremap

nnoremap("<leader>pf", function()
    require('telescope.builtin').find_files()
end)
