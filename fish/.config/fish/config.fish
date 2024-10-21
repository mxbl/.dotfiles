# Environment Variables
set fish_greeting
set -x EDITOR nvim
set -x NVIM_LOG_FILE $HOME/.cache/nvim/log
set -x FISHDIR $HOME/.config/fish
set -x TERM xterm-256color
set -x DOTFILES $HOME/.dotfiles
set -x PATH            \
    $HOME/.cargo/bin   \
    $HOME/racket/bin   \
    $HOME/.local/bin   \
    $HOME/go/bin       \
    $HOME/bin          \
    $HOME/opt/node/bin \
    $HOME/.nix-profile/bin \
    /nix/var/nix/profiles/default/bin \
    /net/adm/bin       \
    /extra2/max/riscv-gnu-toolchain/bin \
    /usr/local/go/bin  \
    /usr/local/bin     \
    /usr/local/sbin    \
    /usr/bin           \
    /usr/sbin          \
    /usr/games         \
    /bin               \
    /sbin

# Fzf globals, to change fzf behaviour
set -x FZF_DEFAULT_OPTS "--height=10% --inline-info --cycle"
set -x FZF_REVERSE_ISEARCH_OPTS "--layout=reverse"
set -x FZF_FIND_AND_EXECUTE_OPTS "--layout=reverse --multi"

. $FISHDIR/functions.fish
. $FISHDIR/aliases.fish
#. $FISHDIR/bindings.fish
. $FISHDIR/prompt.fish
#. $FISHDIR/z.fish
#. $FISHDIR/scratchpad.fish

if string match -r "xterm|screen" $TERM > /dev/zero; and not set -q SSH_CLIENT

    # both shift together work as capslock
    setxkbmap -option "shift:both_capslock"

    #if [ (hostname) = "mxdesk" ]
    #  xmodmap -e "keycode 64  = Super_L" # reassign Alt_L to Super_L
    #  xmodmap -e "remove mod1 = Super_L" # make sure X keeps it out of the mod1 group
    #end

    xset r rate 200 # change keyboard repeat rate
    xset b off      # turn off visual bell
end

# apt install direnv
direnv hook fish | source

if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end

# install zoxide:
# > curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
which zoxide > /dev/null; and zoxide init fish | source

# install atuin:
# > cargo install atuin
which atuin > /dev/null; and atuin init fish | source

# eval (opam env)
set -gx OPAM_SWITCH_PREFIX  /extra/max/opam/default
set -gx OCAML_TOPLEVEL_PATH /extra/max/opam/default/lib/toplevel
set -gx CAML_LD_LIBRARY_PATH                   \
    /extra/max/opam/default/lib/stublibs       \
    /extra/max/opam/default/lib/ocaml/stublibs \
    /extra/max/opam/default/lib/ocaml

builtin -n | /bin/sh -c 'grep -q \'^argparse$\'' 1>/dev/null 2>/dev/null; and set -gx MANPATH :/extra/max/opam/default/man
