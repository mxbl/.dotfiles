lua require("mx")

nnoremap <leader>pg :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<cr>

" usefull ?
nnoremap <leader><leader>m :lua require('telescope.builtin').marks()<cr>
nnoremap <leader><leader>o :lua require('telescope.builtin').vim_options()<cr>

" Find recently opened files
nnoremap <leader>pr :Telescope oldfiles<cr>

" Query the neovim man pages
nnoremap <c-m> :lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <silent><leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<cr>
