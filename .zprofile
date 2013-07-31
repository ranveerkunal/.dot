# Environment variables.
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$GOBIN:$HOME/google_appengine:/usr/local/bin:$PATH
export EDITOR="emacsclient -c"

# Aliases.
alias et=$EDITOR
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias foc='fortune -o -c'
alias gll='fileutil ls -lh --sharded'

# For mac
if foc &> /dev/null; then
else
    alias foc=fortune
fi

if which gdircolors &> /dev/null; then
    alias dircolors=gdircolors
fi

setopt \
prompt_subst \
transient_rprompt

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

# Set the prompt.                                                                                                                                                                                        PP
PROMPT='%{%F{green}%}%~%{%f%} %# '
RPROMPT='%F{yellow}$(prompt_git_info)%{%f%}'

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    emacs --daemon
fi

if [[ -z $TMUX ]]; then
    tmuxre
fi
