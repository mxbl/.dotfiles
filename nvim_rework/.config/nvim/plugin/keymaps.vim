" Moving between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quickfix list
nnoremap <c-n> :cnext<cr>
nnoremap <c-p> :cprev<cr>

nmap <leader>pv :Ex<cr>

" ?
vnoremap <leader>d "_d
xnoremap <leader>p "_dP

" Primes must have remaps {{{
" Number 5:
nnoremap Y y$

" Number 4: keeping it centered
" keep the cursor centered for n, N and J
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Number 3: Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Number 2: Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Number 1: Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <space>j :m .+1<cr>==
nnoremap <space>k :m .-2<cr>==
" }}}
