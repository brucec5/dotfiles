function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

function _rprompt_exit_status() {
  _EXIT_STATUS=$?

  if (( $_EXIT_STATUS == 0 )); then
    echo "%{%F{cyan}%}<< $_EXIT_STATUS >>%{%f%k%b%}"
  else
  	echo "%{%F{red}%}>> $_EXIT_STATUS <<%{%f%k%b%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K%{${bg[black]}%}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K%{${bg[black]}%}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K%{${bg[black]}%}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K%{${bg[black]}%}%}$(_prompt_char)%{%K%{${bg[black]}%}%} %#%{%f%k%b%} '

RPROMPT='$(_rprompt_exit_status)'
