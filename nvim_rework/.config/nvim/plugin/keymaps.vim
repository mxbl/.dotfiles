" Navigating the splits
map <silent><c-j> :lua require("mx.tmux").navigate("j")<cr>
map <silent><c-k> :lua require("mx.tmux").navigate("k")<cr>
map <silent><c-l> :lua require("mx.tmux").navigate("l")<cr>
map <silent><c-h> :lua require("mx.tmux").navigate("h")<cr>

" quickfix list
nnoremap <c-n> :cnext<cr>
nnoremap <c-p> :cprev<cr>

xmap ga <Plug>(EasyAlign)

inoremap <S-CR> <C-O>o
inoremap <C-CR> <C-O>O

" Tabs
nnoremap <right> gt
nnoremap <left> gT
nnoremap <c-w>i :tabnext<cr>
nnoremap <c-w>u :tabprev<cr>
nnoremap <leader>tn :tabnew<cr>

nnoremap ,v <c-w>K
nnoremap ,h <c-w>H

nnoremap <leader><cr> :so ~/.config/nvim/init.lua<cr>

" Primes must have remaps {{{
" Yank line
nnoremap Y y$

" keep the cursor centered for n, N and J
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <space>k :m .-2<cr>==
nnoremap <space>j :m .+1<cr>==
" }}}

" This interfiers with normal tab usage, is this a problem?
inoremap <silent> <Tab> <cmd>lua require'luasnip'.jump(1)<cr>
snoremap <silent> <Tab> <cmd>lua require'luasnip'.jump(1)<cr>
snoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<cr>

" vim: fdm=marker
