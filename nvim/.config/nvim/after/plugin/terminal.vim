function! s:small_terminal() abort

  " Make a new window and move to the very bottom
  new
  wincmd J

  call nvim_win_set_height(0, 12)
  set winfixheight
  term /bin/bash
endfunction

" Make a small terminal at the bottom of the screen
nnoremap <leader>st :call <SID>small_terminal()<CR>
