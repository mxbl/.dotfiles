local nnoremap = require("mx.keymap").nnoremap

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<leader>pf", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>ph", function()
    require('telescope.builtin').oldfiles()
end)
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>")}
end)

nnoremap("<leader>vdf", function()
    require('mx.telescope').search_dotfiles()
end)
