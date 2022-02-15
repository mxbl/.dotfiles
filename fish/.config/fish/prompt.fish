function fish_prompt --description 'Write out the prompt'
  set laststatus $status

  function _git_branch_name
    echo (git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
  end

  function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty 2>/dev/null)
  end

  if [ (_git_branch_name) ]
    set -l git_branch (set_color green)(_git_branch_name)
    if [ (_is_git_dirty) ]
      for i in (git branch -qv --no-color | string match -r '\*' | cut -d' ' -f4- | cut -d] -f1 | tr , \n)\
        (git status --porcelain | cut -c 1-2 | uniq)
        switch $i
                  case "*[ahead *"
                    set git_status "$git_status"(set_color red)⬆
                  case "*behind *"
                    set git_status "$git_status"(set_color red)⬇
                  case "."
                    set git_status "$git_status"(set_color green)✚
                  case " D"
                    set git_status "$git_status"(set_color red)✖
                  case "*M*"
                    set git_status "$git_status"(set_color green)✱
                  case "*R*"
                    set git_status "$git_status"(set_color purple)➜
                  case "*U*"
                    set git_status "$git_status"(set_color brown)═
                  case "??"
                    set git_status "$git_status"(set_color red)≠
              end
          end
      else
        set git_status (set_color green):
      end
      set git_info "("(set_color -o)"$git_status"(set_color normal)"$git_branch"(set_color normal)")"
  end

  set_color -b black
  printf '%s%s@%s %s%s' (set_color -o white) (whoami) (hostname) (prompt_pwd) (set_color normal)
  #printf ' %s%s%s' (set_color -o white) (echo $PWD | sed -e "s|^$HOME|~|") (set_color normal)
  printf '%s' $git_info

  if test $laststatus -ne 0
    printf " %s%s" (set_color -o red) "✘"
    #printf " %s%s " (set_color -o green) "✔"
  end

  printf " "

  set_color normal
end

function fish_right_prompt
end

# remove the vi mode prompt on the left side
function fish_mode_prompt
end
