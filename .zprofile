# Environment variables.
PATH=~/google_appengine:$PATH
EDITOR="emacsclient -c"
PROMPT='%{%F{green}%}%~%{%f%} %# '

# Aliases.
alias et=$EDITOR
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias foc='/usr/games/fortune -o -c'

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    emacs --daemon
fi

if [[ -z $TMUX ]]; then
    tmuxre
fi
