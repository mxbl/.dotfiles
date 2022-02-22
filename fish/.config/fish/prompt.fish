function fish_prompt --description 'Write out the prompt'
  set laststatus $status

  function _git_branch_name
    printf '%s' (git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
  end

  set -g git_branch (_git_branch_name)

  # Calculate the current working directory in dependence of the base
  # git directory we in
  function _current_working_directory
    if test -n "$git_branch"
      set -l this_dir (pwd)

      # equals "" in case of a bare repo
      set -l git_dir (git rev-parse --show-toplevel)
      if not test -n "$git_dir"
        set git_dir (git rev-parse --git-dir)
      end

      if begin ; test $git_dir = $this_dir ; or test $git_dir = "." ; end
        echo (string split -r -m1 / $this_dir)[2]
      else
        set git_dir (string split -r -m1 / $git_dir)[1]
        string sub -s2 (string replace $git_dir "" $this_dir)
      end
    else
      prompt_pwd
    end
  end

  function _is_git_dirty
    if test -n "$git_branch"
      echo (git status -s --ignore-submodules=dirty 2>/dev/null)
    end
  end

  function _git_commit_hash
    if test -n "$git_branch"
      echo (git log --pretty=format:'%h' -n 1 2>/dev/null)
    end
  end

  function _git_commit_message
    if test -n "$git_branch"
      set max_commit_length 25
      printf "/%s/" (git log -1 --pretty=%B 2>/dev/null | head -n1)
    end
  end

  if test -n "$git_branch"
    if [ (_is_git_dirty) ]
      for i in (git branch -qv --no-color | string match -r '\*' | cut -d' ' -f4- | cut -d] -f1 | tr , \n)\
        (git status --porcelain | cut -c 1-2 | uniq)
        switch $i
          case "*[ahead *"
            set git_status "$git_status"(set_color ff3333)⬆
          case "*behind *"
            set git_status "$git_status"(set_color ff3333)⬇
          case "."
            set git_status "$git_status"(set_color 32cd32)✚
          case " D"
            set git_status "$git_status"(set_color ff3333)✖
          case "*M*"
            set git_status "$git_status"(set_color 32cd32)✱
          case "*R*"
            set git_status "$git_status"(set_color purple)➜
          case "*U*"
            set git_status "$git_status"(set_color brown)═
          case "??"
            set git_status "$git_status"(set_color ff3333)≠
        end
      end
      #else
      #  set git_status (set_color green):
    end

    set git_info (set_color -o)"$git_status"(set_color 444444)":"(set_color purple)"$git_branch"(set_color normal)
  end

  #set_color -b black

  printf '\n'
  printf '%s%s ' (set_color -o white)(_current_working_directory)
  if test -n "$git_branch"
    printf '%s ' $git_info
    printf '%s%s%s%s ' \
      (set_color ff8800)(_git_commit_hash)(set_color 444444)(_git_commit_message)
  end

  printf '%s' (set_color normal)

  if test $laststatus -ne 0
    printf "%s%s%s " (set_color -o red) "✘" (set_color normal)
  end

  # put the prompt on the next line if there is all the git information
  if test -n "$git_branch"
    printf "\n"
  end

  printf "%s❯%s " (set_color -o cyan) (set_color normal)
end

function fish_right_prompt
end

# remove the vi mode prompt on the left side
function fish_mode_prompt
end
