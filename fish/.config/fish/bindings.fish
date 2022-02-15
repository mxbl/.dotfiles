# vi keybindings
function fish_user_key_bindings
    fish_vi_key_bindings

    #fzf_key_bindings
    bind -M insert \cr __fzf_reverse_isearch
    bind -M insert \cx __fzf_find_and_execute

    bind -M insert -m default jk backward-char force-repaint
    bind -M insert \cp history-search-backward
    bind -M insert \cn history-search-forward
end

set fish_key_bindings fish_user_key_bindings
