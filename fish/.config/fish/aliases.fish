#alias ll       'ls -lh'
alias l        'eza'
alias ll       'l -lghB --git'
alias la       'l -lghBa --git'
alias lg       'l -lG'
alias lt       'l -lghB --git --tree'
alias sc       'source ~/.config/fish/config.fish'
alias df       'df -h'
alias i3lock   'i3lock -c 000000'
alias swapcaps 'setxkbmap -option "ctrl:swapcaps"'

# fzf bindings
alias fz       'fzf --border --reverse --height=10%'
alias fzp      'fzf --border --reverse --height=10% --preview \'cat {}\''
alias fzt      'fzf-tmux --reverse'
alias fztp     'fzf-tmux --reverse --preview \'cat {}\''

# set tmux colors
alias color_rosa 'tmux select-pane -P \'bg=#630734\''

alias cdl 'cd; clear'
alias ip 'ip --color'
alias bat 'batcat --theme base16 -p'
