function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%{$reset_color%}%{$fg_bold[white]%}%c $(prompt_char)$(git_prompt_info)> %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$reset_color%}%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[white]%})"
