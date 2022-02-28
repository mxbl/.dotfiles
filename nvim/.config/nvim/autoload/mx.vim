" Save file and source it if its a lua or vim file
if !exists('*mx#save_and_exec')
  function! mx#save_and_exec() abort
    if &filetype == 'vim'
      :silent! write
      :source %
    elseif &filetype == 'lua'
      :silent! write
      :luafile %
    else
      :silent! write
    endif

    return
  endfunction
endif
