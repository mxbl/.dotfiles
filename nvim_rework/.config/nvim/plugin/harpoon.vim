nnoremap <silent>,e :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent>,,a :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent>,a :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent>,s :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent>,d :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent>,f :lua require("harpoon.ui").nav_file(4)<cr>
