# Simple fish replacement for zsh z plugin
# TODO:
#  - [x] set up list of directories to exclude
#  - [ ] remove a path from datafile

set -g __zdata "$HOME/.z"
set -g __zignore $HOME

function __z_setup
    if not test -f "$__zdata"
        touch "$__zdata"
    end
end

# Run handler on PWD change, save current working directory
function __z_save_pwd --on-variable PWD
    for p in $__zignore
        if test "$p" = $PWD
            return
        end
    end
    set -l unique 1
    for p in (cat $__zdata)
        if test "$p" = $PWD
            set unique 0
        end
    end

    if test $unique -eq 1
        echo $PWD >> "$__zdata"
    end
end

__z_setup
