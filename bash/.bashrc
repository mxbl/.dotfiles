#
# ~/.bashrc
#

xset r rate 180
xset b off
setxkbmap -option "shift:both_capslock"

# Prompt
function ps1full { PS1='\[\e[1;37m\]\u@\h \w \[\033[00m\]' ; }
function ps1clean { PS1='\[\e[1;37m\]> \[\033[00m\]' ; }
ps1full

# Aliases
export GREP_COLOR="1;32"
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias cl='clear'

#THISDIR=$(dirname $(readlink -f ~/.bashrc))

bind 'set completion-ignore-case on'

export HISTCONTROL=ingnoreboth:erasedups
export EDITOR=vim

# Path
path=$PATH
export PATH=$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.rvm/rubies/default/bin
export PATH=$PATH:/net/adm/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/opt/node/bin
export PATH=$PATH:$path

# Source external scripts and environments
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# functions {{{
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
function ex {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)  tar xvjf       $1;;
            *.tar.gz)   tar xvzf       $1;;
            *.tar.xz)   tar xvJf       $1;;
            *.tar.lzma) tar --lzma xvf $1;;
            *.bz2)      bunzip         $1;;
            *.rar)      unrar          $1;;
            *.gz)       gunzip         $1;;
            *.tar)      tar xvf        $1;;
            *.tbz2)     tar xvjf       $1;;
            *.tgz)      tar xvzf       $1;;
            *.zip)      unzip          $1;;
            *.Z)        uncompress     $1;;
            *.7z)       7z x           $1;;
            # mount OS X disk image
            *.dmg)      hdiutul mount $1;;
            *) echo "'$1' cannot be extracted via >ex<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# (dt.)
# Der Laptop ist per Wlan im internet;
# Das Netzwerk am Ethernet Interface kann den Laptop jetzt als Gateway benutzen.
# Dazu muss die ip (eth) des Laptop als Gateway gesetzt werden
# TODO: generlize the interface names
# TODO: get the ip without the use of ifconfig
function act_as_gateway {

    # enable ip forwarding
    sudo sysctl -w net.ipv4.ip_forward=1

    # configure forwarding between the interfaces with iptables
    local wlan_iface_name=wlp3s0
    local eth_iface_name=enp0s25
    local wlan_iface_ip=`ifconfig $wlan_iface_name 2>/dev/null | awk '/inet addr:/ {print $2}' | sed 's/addr://'`
    local eth_iface_ip=`ifconfig $eth_iface_name 2>/dev/null | awk '/inet addr:/ {print $2}' | sed 's/addr://'`
    sudo iptables -t nat -A POSTROUTING ! -d `echo $eth_iface_ip | cut -d. -f1-3`.0/24 -o $wlan_iface_name -j SNAT --to-source $wlan_iface_ip
}

# force a running dd process to show his status
function ddwatch { sudo kill -USR1 `pgrep ^dd` ; }

# suspend/continue process by name
function suspendp { kill -TSTP `pgrep $1` ; }
function contp { kill -CONT `pgrep $1` ; }

function mkd { mkdir -p "$1" ; cd "$1" ; }
function tmuxbg { tmux select-pane -P "$color" }
function swapcaps { setxkbmap -option "ctrl:swapcaps" ; }

# Fuzzy change directory
function fcd { cd $(find -type d | fzf) }
alias ,f='fcd'
# }}}
# Navigate places {{{
# requirements:
#  - fzf (pacman -S fzf)

NAV_PLACES=$HOME/.places
[ ! -f $NAV_PLACES ] && \
    echo $NAV_PLACES > $NAV_PLACES

FZF_CMD="fzf --reverse --height 40%"

# build a database of places (files, directories)
# `$1` is a filename or otherwise if empty use the 
# current working directory
function nav_save {
    local target=$1
    if [ "$target" = "" ]; then
        target=$(pwd)
    else
        # alternative to realpath without destroying
        # symlinks in the path
        target="$(pwd)/${target}"
    fi

    grep $target $NAV_PLACES -x 1>/dev/zero
    [ $? = 0 ] || \
        echo $target >> $NAV_PLACES
}

# open file with $EDITOR or cd into directory
function nav_goto {
    target=$(cat $NAV_PLACES | eval $FZF_CMD)
    [ "$target" = "" ] && return
    [ -f $target ] && \
        eval $EDITOR $target
    [ -d "$target" ] && \
        cd $target
}

alias s=nav_save
alias g=nav_goto
# }}}
# Helps {{{
White='\e[1;37m'
LightGray='\e[0;37m'
DarkGray='\e[1;30m'
Normal='\e[0m'

function help/nmap() {
    echo -e "${White}Flags:${Normal}"
    echo -e " -sC  ${DarkGray}scan with default NSE scripts (discovery,save)${Normal}"
    echo -e " -sV  ${DarkGray}attempts to determine the version of service${Normal}"
    echo -e " -oA  ${DarkGray}<filename> output in all three formats (nmap, xml, grep)${Normal}"
    echo -e " -p-  ${DarkGray}all ports${Normal}"
    echo -e " -sU  ${DarkGray}UDP ports${Normal}"
    echo -e " -vvv ${DarkGray}most verbose output${Normal}"
    echo -e "${White}e.g.${Normal}"
    echo -e " • nmap -sC -sV -oA  FILENAME HOSTNAME/IP"
    echo -e " • nmap -vvv -p- -oA FILENAME-alltcp HOSTNAME/IP"
    echo -e " • nmap -vvv -sU -oA FILENAME-1000udp HOSTNAME/IP"
}

function help/marker () {
    echo -e "Ctrl-space     ${DarkGray}search for commands that match the current written string in the command-line${Normal}"
    echo -e "Ctrl-k         ${DarkGray}(or marker mark): Bookmark a command${Normal}"
    echo -e "Ctrl-t         ${DarkGray}place the cursor at the next placeholder, identified by '{{anything}}'${Normal}"
    echo -e "marker remove  ${DarkGray}remove a bookmark${Normal}"
}
# }}}
