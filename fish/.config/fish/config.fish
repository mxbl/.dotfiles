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
    /usr/games       \
    /bin             \
    /sbin

# Fzf globals, to change fzf behaviour
set -x FZF_DEFAULT_OPTS "--height=10% --inline-info --cycle"
set -x FZF_REVERSE_ISEARCH_OPTS "--layout=reverse"
set -x FZF_FIND_AND_EXECUTE_OPTS "--layout=reverse --multi"

. $FISHDIR/functions.fish
. $FISHDIR/aliases.fish
. $FISHDIR/bindings.fish
. $FISHDIR/prompt.fish

if string match -r "xterm|screen" $TERM > /dev/zero

    # both shift together work as capslock
    setxkbmap -option "shift:both_capslock"

    if [ (hostname) = "mxdesk" ]
      xmodmap -e "keycode 64  = Super_L" # reassign Alt_L to Super_L
      xmodmap -e "remove mod1 = Super_L" # make sure X keeps it out of the mod1 group
    end

    xset r rate 180 # change keyboard repeat rate
    xset b off      # turn off visual bell
end
