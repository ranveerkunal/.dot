# Environment variables.
export GOROOT=/usr/local/Cellar/go/1.7/libexec
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/gocode
export PATH=/usr/local/bin:$GOPATH/bin:$GOBIN:$PATH
export EDITOR="emacsclient -c -nw"
export PATH=$HOME/anaconda3/bin:$PATH
export MANPATH=$HOME/anaconda3/share/man:$MANPATH
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$JAVA_HOME/bin:$PATH
export ES_USER=amadeira
export ES_PWD=feelinsolucky123.

# Aliases
alias et=$EDITOR
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias git='noglob git'
alias foc='fortune -o'

setopt \
prompt_subst \
transient_rprompt
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
# Enable auto-executionfunctions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

source activate isnap

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    emacs --daemon
fi

if [[ -z $TMUX ]]; then
    tmuxre
fi

# Mac
alias dircolors=gdircolors
