PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
  # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  PS4=$'%D{%M%S%.} %N:%i> '
  exec 3>&2 2>$HOME/tmp/startlog.$$
  setopt xtrace prompt_subst
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh/custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mytheme-custom"

plugins=(docker git colored-man-pages)

source "$ZSH/oh-my-zsh.sh"

# Customize to your needs...

export GOPATH=$HOME/go
export GOROOT=/usr/local/go

PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/dotfiles/bin:$GOPATH/bin:$GOROOT/bin:$HOME/Library/Python/3.7/bin

# If neovim is installed, alias that to vim because muscle memory
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export EDITOR=vim
export GIT_EDITOR=vim

alias untouch='rm'

alias reload='source ~/.zshrc'

alias cdfinder="cd \"\$(osascript -e 'tell app \"Finder\" to POSIX path of (insertion location as alias)')\""

alias vim='nocorrect /usr/bin/vim'
alias git='nocorrect git'
alias got='nocorrect git'
alias gut='nocorrect git'
alias fig='nocorrect git'
alias gph='nocorrect git push origin HEAD'
alias gs='nocorrect git status'
alias gc='nocorrect git commit'
alias gcm='nocorrect git commit -m'
alias gcundo='nocorrect git reset --soft "HEAD^"'
alias glog='nocorrect git log'
alias glogd='nocorrect git log ..develop'
alias glogm='nocorrect git log ..master'
alias gslog='release-notes'
alias gco='nocorrect git checkout'
alias gcob='nocorrect git checkout -b'
alias gcod='nocorrect git checkout develop'
alias gcom='do-on-main-branch checkout'
alias gcop='nocorrect git checkout -p'
alias gpu='nocorrect git pull'
alias gpuu='nocorrect git pull origin $(this-branch)'
alias gst='nocorrect git stash -u'
alias gstp='nocorrect git stash pop'
alias gstl='nocorrect git stash list'
alias gssc='gss | wc -l | tr -d " "'
alias gdd='git diff develop'
alias gdm='do-on-main-branch diff'
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
alias gcp='nocorrect git cherry-pick'
alias gconflict="git ls-files -u  | cut -f 2 | sort -u | tr '\n' ' '"
alias gus="nocorrect git unstage"
alias gusp="git unstage -p"
compdef _git gs=git-status

if [ "$TERM" = "xterm-kitty" ] && which kitty >/dev/null; then
  kitty + complete setup zsh | source /dev/stdin
  alias icat="kitty +kitten icat"
  alias kdiff="kitty +kitten diff"

  alias ggd="git difftool --no-symlinks --dir-diff"
fi

alias cspec="script/spec -c -f n"

function this-branch() {
  git rev-parse --abbrev-ref HEAD
}

function git-commit-diff() {
  git diff "$1^!"
}

function git-branch-exists() {
  local branch=$1
  git show-ref --verify --quiet "refs/heads/$branch"
}

# gcom used to be an alias to checkout the master branch,
# but now it's a function to checkout either master or main, whichever one exists.
function do-on-main-branch() {
  local action=$1
  if git-branch-exists main; then
    git "$action" main
  elif git-branch-exists master; then
    git "$action" master
  else
    echo "There is no main or master branch, can't do that"
    return 1
  fi
}

function mac2unix {
  tr '\r' '\n' < "$1"
}

# Usage: lazy-source executable-to-load-on path-to-source
function lazy-source() {
  eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

function logtail() {
  # TODO: make the syntax highlighting more general? currently only highlights HTTP status codes (or similar looking things)
  tail -f "$@" | perl -pe 's/ [0-9]{3} [A-Za-z\s]+/\e[1;34m$&\e[0m/g'
}

# Keybindings!
if [ "$(uname)" != "Linux" ]; then
  bindkey '[C' forward-word
  bindkey '[D' backward-word
fi

if [[ -a "${HOME}/.local-zshrc" ]]; then
  source "${HOME}/.local-zshrc"
fi

if [[ "$PROFILE_STARTUP" == true ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
fi

export JAVA_OPTS=-Dlog4j2.formatMsgNoLookups=true

export LOG4J_FORMAT_MSG_NO_LOOKUPS=true

# No idea why, but on osx tab completion no longer works unless I explicitly compinit.
compinit
