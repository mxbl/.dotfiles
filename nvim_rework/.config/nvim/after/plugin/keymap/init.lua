local nnoremap = require("mx.keymap").nnoremap

-- What does that do?
nnoremap("<leader>f", function()
    vim.lsp.buf.format()
end)
