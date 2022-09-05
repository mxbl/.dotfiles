function mkcd --description="create and enter directory"
    mkdir -p $argv[1]
    cd $argv[1]
end

function srv --description="http server to serve the current directory"
    python -c '
import http.server, socketserver, socket
PORT = 8000
HANDLER = http.server.SimpleHTTPRequestHandler
with socketserver.TCPServer(("", PORT), HANDLER) as httpd:
    print("serving @ %s:%d" %(socket.gethostbyname(socket.gethostname()),PORT))
    try:
        httpd.serve_forever()
    except:
        pass # leave with Ctrl-C
'
end

### / Fzf /

function fs --description="Switch tmux sessions"
    tmux list-sessions -F "#{session_name}" | fzf | xargs tmux switch-client -t
end

function fssh --description="Fuzzy-find ssh host and ssh into it"
    ag '^host [^*]' ~/.ssh/config | cut -d' ' -f2 | fzf --border --reverse --height=10% | xargs ssh
end

function fpdf --description="Fuzzy-find a pdf file and open it with evince"
    find . -name "*.pdf" | fzf --border --reverse --height=10% | xargs evince
end

function __fzfcmd
  set -q FZF_TMUX; or set -l FZF_TMUX 0
  if test "$FZF_TMUX" -eq 1
    set -q FZF_TMUX_HEIGHT; or set -l FZF_TMUX_HEIGHT 40%
    fzf-tmux -d$FZF_TMUX_HEIGHT $argv
  else
    fzf $argv
  end
end

function __fzf_find_and_execute
  builtin history --null | \
    eval "__fzfcmd --read0 +s -m --tiebreak=index --toggle-sort=ctrl-r \
    $FZF_DEFAULT_OPTS $FZF_FIND_AND_EXECUTE_OPTS" \
    | read -z select

  if not test -z $select
    printf "\nexecuting: $select\n"
    eval $select
  end

  commandline -f repaint
end

function __fzf_reverse_isearch
  builtin history --null | \
    eval "__fzfcmd --read0 +s --tiebreak=index --toggle-sort=ctrl-r \
    $FZF_DEFAULT_OPTS $FZF_REVERSE_ISEARCH_OPTS -q (commandline)" | \
    read -z select

  if not test -z $select
    commandline -rb (builtin string trim "$select")
  end

  commandline -f repaint
end

### / Experimental /

# FIXME: do some checks of the last command, crashes the shell if the last
#   command was for example `exec fish`
function __stdout_of_last_command_to_nvim
  eval $history[1] | nvim -
end

function __test_eval_commandline
  set -l cmdl (commandline -b)
  eval $cmdl | nvim -
  commandline -r ""
  #set -l outp (eval $cmdl)
  #commandline -r $outp
end
