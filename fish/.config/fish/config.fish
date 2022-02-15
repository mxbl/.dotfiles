# Environment Variables
set fish_greeting
set -x EDITOR nvim
set -x NVIM_LOG_FILE $HOME/.cache/nvim/log
set -x FISHDIR $HOME/.config/fish
set -x TERM xterm-256color
set -x PATH          \
    $HOME/.cargo/bin \
    $HOME/bin        \
    /usr/local/bin   \
    /usr/local/sbin  \
    /usr/bin         \
    /usr/sbin        \
    /bin             \
    /sbin

# Fzf globals
set -x FZF_DEFAULT_OPTS "--height=10% --inline-info --cycle"
set -x FZF_REVERSE_ISEARCH_OPTS "--layout=reverse"
set -x FZF_FIND_AND_EXECUTE_OPTS "--layout=reverse --multi"

. $FISHDIR/functions.fish
. $FISHDIR/aliases.fish
. $FISHDIR/bindings.fish
. $FISHDIR/prompt.fish

if string match -r "xterm|screen" $TERM > /dev/zero
    setxkbmap -option "shift:both_capslock"
    xset r rate 180
    xset b off
end
