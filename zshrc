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
alias gslog='release-notes'
alias gco='nocorrect git checkout'
alias gcob='nocorrect git checkout -b'
alias gcod='nocorrect git checkout develop'
alias gcom='nocorrect git checkout master'
alias gpu='nocorrect git pull'
alias gpuu='nocorrect git pull origin $(this-branch)'
alias gst='nocorrect git stash -u'
alias gstp='nocorrect git stash pop'
alias gstl='nocorrect git stash list'
alias gssc='gss | wc -l | tr -d " "'
alias gdd='git diff develop'
alias gddh='git diff develop HEAD'
alias gdr='git diff -R'
alias gds='git diff --staged'
alias gsd='gds'
alias gdh='git diff HEAD'
alias gdc="git-commit-diff"
alias gbm='nocorrect git branch -m'
alias ggraph='git log --oneline --graph --decorate'
alias gap='git add --patch'
alias gsl='git stash list'
alias gstd='git stash show -p'
alias gversion='git describe origin/master'
alias gcp='nocorrect git cherry-pick'
alias gconflict="git ls-files -u  | cut -f 2 | sort -u | tr '\n' ' '"
compdef _git gs=git-status

function this-branch() {
  git rev-parse --abbrev-ref HEAD
}

function merged-branches() {
  git branch --merged | ggrep -Pv "..(develop|master|$(this-branch))"
}

function delete-merged-branches() {
  merged-branches | xargs -n 1 git branch -d
}

function git-commit-diff() {
  git diff "$1^!"
}

function release-branch() {
  git flow release $*
}

function release-notes() {
  GVERSION=${1-`gversion`}
  git --no-pager shortlog --grep "pull request" $GVERSION..HEAD
}

function conflicts() {
  git_conflicts=$(gconflict)
  if [ -n "$git_conflicts" ]; then
    subl -n $git_conflicts
  fi
}

# Keybindings!
bindkey '[C' forward-word
bindkey '[D' backward-word

function preRelease {
  set -x # optional, this prints the commands in the console
  git stash
  git checkout master
  if [ $? -ne 0 ] ; then return; fi
  git pull
  if [ $? -ne 0 ] ; then return; fi
  git checkout develop
  git pull
  latestTag=$(git describe origin/master)
  echo "Changes since" $latestTag
  git shortlog --format="%s" --grep "pull request" $latestTag..HEAD
  set +x
}

# takes the release number as a parameter
function release {
  set -x
  git flow release start ${1}
  if [ $? -ne 0 ] ; then return; fi
  git flow release publish ${1}
  if [ $? -ne 0 ] ; then return; fi
  cap staging deploy:rolling -S branch=release/${1}
  set +x
}

# takes the release number as a parameter
function finishRelease {
  set -x
  git pull
  git flow release finish ${1}
  if [ $? -ne 0 ] ; then return; fi
  git pull
  git push
  if [ $? -ne 0 ] ; then return; fi
  git push --tags
  if [ $? -ne 0 ] ; then return; fi
  git checkout master
  if [ $? -ne 0 ] ; then return; fi
  git push
  if [ $? -ne 0 ] ; then return; fi
  cap production deploy:rolling
  set +x
}

function mac2unix {
  cat $1 | tr '\r' '\n'
}
