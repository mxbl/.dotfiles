# Simple fish replacement for zsh z plugin
# TODO:
#  - [x] Set up list of directories to exclude
#  - [ ] Exclude /tmp/*
#  - [ ] Remove a path from datafile
#  - [x] Add weights to each path, so the most used directory is always
#        the first hit.
#  - [ ] Move weights to second position so that path is the first value

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
    for line in (cat $__zdata)
        set vp (string split " " $line)
        if test "$vp[2]" = $PWD
            set unique 0
            set val (math $vp[1] + 1)
            sed -i 's@[[:digit:]]\+ '"$vp[2]"\$'@'"$val $vp[2]"'@g' $__zdata
        end
    end

    # Add the new path, weight is initially set to 1
    if test $unique -eq 1
        echo "1 $PWD" >> "$__zdata"
    end
end

__z_setup
