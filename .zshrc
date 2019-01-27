# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ranveer/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nanotech"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Exports
export GOROOT=/usr/local/Cellar/go/1.11.2/libexec
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/gocode
export PATH=/usr/local/bin:$GOPATH/bin:$GOBIN:$PATH
export EDITOR="emacsclient -c -nw"
export PATH=$HOME/miniconda2/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/google-cloud-sdk/bin:$PATH
export MANPATH=$HOME/miniconda2/share/man:$MANPATH
export CLICOLOR=YES
export FLUTTER_HOME=$HOME/flutter

export ANDROID_APP_DEBUG_KEYSTORE=$HOME/keystore/android.debug.keystore
launchctl setenv ANDROID_APP_DEBUG_KEYSTORE $ANDROID_APP_DEBUG_KEYSTORE

export ANDROID_APP_DEBUG_KEYSTORE_PASSWORD=5MkxsP3RzZ7\`DWK9
launchctl setenv ANDROID_APP_DEBUG_KEYSTORE_PASSWORD $ANDROID_APP_DEBUG_KEYSTORE_PASSWORD
export ANDROID_APP_DEBUG_KEY_PASSWORD=5MkxsP3RzZ7\`DWK9
launchctl setenv ANDROID_APP_DEBUG_KEY_PASSWORD $ANDROID_APP_DEBUG_KEY_PASSWORD

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
source activate py36

# Aliases
alias et=$EDITOR
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias git='noglob git'
alias foc='fortune -o'
alias dircolors=gdircolors
eval $(gdircolors ~/.dircolors/dircolors.256dark)
alias ls='gls --color=auto'
alias ll='ls -al'

# Autostart scrits.
if [[ -z $(pidof emacs) ]]; then
    GOPATH=$HOME/src/bazel-bin/gopath emacs --daemon
fi

if [[ -z $TMUX ]] && [[ -n $ITERM_SESSION_ID ]]; then
    tmuxre
fi

foc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ranveer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ranveer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ranveer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ranveer/google-cloud-sdk/completion.zsh.inc'; fi
