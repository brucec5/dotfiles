function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}*%{%f%k%b%}"
  else
    echo ' '
  fi
}

function _rprompt_exit_status() {
  _EXIT_STATUS=$?

  if (( $_EXIT_STATUS == 0 )); then
    echo "%{%F{cyan}%}$_EXIT_STATUS%{%f%k%b%}"
  else
  	echo "%{%F{red}%}$_EXIT_STATUS%{%f%k%b%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{green}%}[%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_RVM_PROMPT_PREFIX="%{%B%F{green}%}(%{%B%F{red}%}"
ZSH_THEME_RVM_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%})"

PROMPT='%{%f%k%b%}
%{%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%}%~ $(git_prompt_info)%E%{%f%k%b%} $(rvm_prompt_info)
$(_prompt_char)% %#%{%f%k%b%} '

RPROMPT='$(_rprompt_exit_status)'
