function _exit_status() {
  _EXIT_STATUS=$?

  if (( $_EXIT_STATUS == 0 )); then
    echo "%{%F{cyan}%}<$_EXIT_STATUS>%{%f%k%b%}"
  else
    echo "%{%F{red}%}<$_EXIT_STATUS>%{%f%k%b%}"
  fi
}

function _proxy_setting_prompt() {
  if [ -n "$HTTP_PROXY_NAME" ]; then
    echo "%{%F{blue}%}<$HTTP_PROXY_NAME>%{%f%k%b%} "
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{green}%}[%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

preexec () {
  (( $#_elapsed > 1000 )) && set -A _elapsed $_elapsed[-1000,-1]
  typeset -ig _start=SECONDS
}

precmd () {
  (( _start >= 0 )) && set -A _elapsed $_elapsed $(( SECONDS-_start ))
  _start=-1

  # Echo a bell to cause AwesomeWM to flag the terminal emulator as 'urgent'
  if [ $(uname) = "Linux" ]; then
    echo -ne "\a"
  else
    # Echo a SetMark escape command to make iTerm cool
    echo -ne "\033]50;SetMark\a"
  fi
}

# _AWS_OKTA_PROMPT=''

# if [ -n "$AWS_OKTA_PROFILE" ]; then
#   _AWS_OKTA_PROMPT="%{%b%F{green}%}(aws: $AWS_OKTA_PROFILE) "
# fi

PROMPT='%{%f%k%b%}
%{%b%F{yellow}%}(level $SHLVL) %{%B%F{blue}%}[%*] %{%b%F{yellow}%}($_elapsed[-1] sec) $(_exit_status) %{%b%F{yellow}%}%~ $(_proxy_setting_prompt)$(git_prompt_info)%E%{%f%k%b%}
%{%f%k%b%}%# '
