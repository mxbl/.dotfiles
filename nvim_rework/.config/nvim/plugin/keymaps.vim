" Navigating the splits
map <silent><c-j> :lua require("mx.tmux").navigate("j")<cr>
map <silent><c-k> :lua require("mx.tmux").navigate("k")<cr>
map <silent><c-l> :lua require("mx.tmux").navigate("l")<cr>
map <silent><c-h> :lua require("mx.tmux").navigate("h")<cr>

" quickfix list
nnoremap <c-n> :cnext<cr>
nnoremap <c-p> :cprev<cr>
