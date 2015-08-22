# Environment variables.
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/gocode
export GOROOT_BOOTSTRAP=/opt/homebrew/opt/go/libexec/
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=/Users/ranveer/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Aliases.
export ANDROID_DEVEL=$HOME/android
export ANDROID_HOME=$ANDROID_DEVEL/sdk
export NDK=$ANDROID_DEVEL/android-ndk-r8e
export NDK_TOOLCHAIN=$ANDROID_DEVEL/ndk-toolchain

export PATH=/Users/ranveer/homebrew/bin:/usr/local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GOPATH/bin:$GOBIN:$HOME/google_appengine:/opt/homebrew/bin:$PATH
export EDITOR="emacsclient -c -nw"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
alias et=$EDITOR
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias git='noglob git'
alias fileutil='noglob fileutil'
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
# Enable auto-executionfunctions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    emacs --daemon
fi

if [[ -z $TMUX ]]; then
    tmuxre
fi
