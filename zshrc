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
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/Users/chris/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/chris/bin

export PAGER=vimpager

alias untouch='rm'

alias reload='source ~/.zshrc'

alias vim='nocorrect /usr/bin/vim'
alias git='nocorrect git'
alias got='nocorrect git'
alias gut='nocorrect git'
alias fig='nocorrect git'
alias gph='nocorrect git push origin HEAD'
alias gs='nocorrect git status'
alias gc='nocorrect git commit'
alias gca='nocorrect git commit -a'
alias gcm='nocorrect git commit -m'
alias gcam='nocorrect git commit -am'
alias gcundo='nocorrect git reset --soft "HEAD^"'
alias glog='nocorrect git log'
alias glogd='nocorrect git log ..develop'
alias glogm='nocorrect git log ..master'
alias gslog='release_notes'
alias gco='nocorrect git checkout'
alias gcob='nocorrect git checkout -b'
alias gcod='nocorrect git checkout develop'
alias gcom='nocorrect git checkout master'
alias gpu='nocorrect git pull'
alias gst='nocorrect git stash -u'
alias gstp='nocorrect git stash pop'
alias gstl='nocorrect git stash list'
alias gssc='gss | wc -l | tr -d " "'
alias gdd='git diff develop'
alias gdr='git diff -R'
alias gds='git diff --staged'
alias gdh='git diff HEAD'
alias gdc="git_commit_diff"
alias gbm='nocorrect git branch -m'
alias ggraph='git log --oneline --graph --decorate'
alias gap='git add --patch'
alias gsl='git stash list'
alias gsd='git stash show -p'
compdef _git gs=git-status

function git_commit_diff() {
  git diff "$1^!"
}

function release_branch() {
  git flow release $*
}

function release_notes() {
  git --no-pager shortlog --grep "pull request" $1..HEAD
}

# Keybindings!
bindkey '[C' forward-word
bindkey '[D' backward-word

