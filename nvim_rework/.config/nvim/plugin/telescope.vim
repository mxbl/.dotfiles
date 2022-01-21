lua require("mx")

nnoremap <space>pg :lua require('telescope.builtin').git_files()<cr>
nnoremap <space>pf :lua require('telescope.builtin').find_files()<cr>
nnoremap <space>pb :lua require('telescope.builtin').buffers()<cr>
nnoremap <space>vh :lua require('telescope.builtin').help_tags()<cr>

nnoremap <space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <space>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<cr>
