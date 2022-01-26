lua require("mx")

nnoremap <leader>pg :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<cr>
