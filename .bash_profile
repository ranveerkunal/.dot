# Environment variables.
PATH=~/google_appengine:$PATH

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    emacs --daemon
fi

if [[ -z $TMUX ]]; then
    if [[ $(pidof tmux) ]]; then
	tmux attach
    else
	tmux
    fi
fi

# Aliases.
alias et="emacsclient -c"

# Run bashrc
. ~/.bashrc
