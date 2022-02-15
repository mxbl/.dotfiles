function fish_prompt --description 'Write out the prompt'
  set laststatus $status

  function _git_branch_name
    echo (git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
  end

  set -g git_branch (_git_branch_name)

  function _current_working_directory
    if test -n "$git_branch"
      set -l git_dir  (git rev-parse --show-toplevel)
      set -l this_dir (pwd)

      if [ $git_dir = $this_dir ]
        echo (string split -r -m1 / $this_dir)[2]
      else
        set git_dir (string split -r -m1 / $git_dir)[1]
        string replace $git_dir "" $this_dir
      end
    else
      echo (prompt_pwd)
    end
  end

  function _is_git_dirty
    if test -n "$git_branch"
      echo (git status -s --ignore-submodules=dirty 2>/dev/null)
    end
  end

  function _git_commit_hash
    if test -n "$git_branch"
      echo (git log --pretty=format:'%h' -n 1)
    end
  end

  function _git_commit_message
    if test -n "$git_branch"
      set max_commit_length 25
      echo (git log -1 --pretty=%B | head -n1)
    end
  end

  if test -n "$git_branch"
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

  printf '%s'        (set_color -o white)
  printf '%s:%s '    (whoami) (_current_working_directory)
  printf '%s '       $git_info
  printf '%s %s '    (_git_commit_hash) (_git_commit_message)
  printf '%s'        (set_color normal)

  if test $laststatus -ne 0
    printf "%s%s%s" (set_color -o red) "✘" (set_color normal)
    #printf " %s%s " (set_color -o green) "✔"
  end

  printf "\n❯ "

  set_color normal
end

function fish_right_prompt
end

# remove the vi mode prompt on the left side
function fish_mode_prompt
end
