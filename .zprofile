# Environment variables.
export GOROOT=/usr/local/Cellar/go/1.9.2/libexec
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/gocode
export PATH=/usr/local/bin:$GOPATH/bin:$GOBIN:$PATH
export EDITOR="emacsclient -c -nw"
export PATH=$HOME/miniconda2/bin:$PATH
export MANPATH=$HOME/miniconda2/share/man:$MANPATH
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home'
export PATH=$JAVA_HOME/bin:$PATH
export CLICOLOR=YES

# Aliases
alias et=$EDITOR
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias git='noglob git'
alias foc='fortune -o'
alias ubiquity='ssh -i ~/.ssh/scmac.pem ubuntu@ranveer.servebeer.com -L 8888:localhost:8888'
alias ls='gls --color=auto'
alias ll='ls -al'

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

source activate base

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    emacs --daemon
fi

if [[ -z $TMUX ]]; then
    tmuxre
fi

# Mac
alias dircolors=gdircolors
