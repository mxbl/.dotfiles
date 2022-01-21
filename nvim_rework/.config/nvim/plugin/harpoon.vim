nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent><space>ha :lua require("harpoon.mark").add_file()<cr>

nnoremap <silent><space>1 :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent><space>2 :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent><space>3 :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent><space>4 :lua require("harpoon.ui").nav_file(4)<cr>
