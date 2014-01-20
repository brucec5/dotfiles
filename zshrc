# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mytheme-custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow osx rvm rails brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/chris/.rvm/gems/ruby-1.9.3-p484@fa_management_gateway/bin:/Users/chris/.rvm/bin:/Users/chris/bin:$PATH

alias vim='nocorrect /usr/bin/vim'
alias git='nocorrect git'
alias got='nocorrect git'
alias gut='nocorrect git'
alias fig='nocorrect git'
alias gph='nocorrect git push origin HEAD'
alias gs='nocorrect git status'
alias gca='nocorrect git commit -a'
alias gcm='nocorrect git commit -m'
alias gcam='nocorrect git commit -am'
alias glog='nocorrect git log'
alias gco='nocorrect git checkout'
alias gcob='nocorrect git checkout -b'
alias gcod='nocorrect git checkout develop'
alias gcom='nocorrect git checkout master'
alias gpu='nocorrect git pull'
alias gst='nocorrect git stash'
alias gstp='nocorrect git stash pop'
compdef _git gs=git-status

# Keybindings!
bindkey '[C' forward-word
bindkey '[D' backward-word

