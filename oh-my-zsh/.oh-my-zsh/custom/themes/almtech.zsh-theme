function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n)%{$reset_color%}:%{$fg_bold[blue]%}%(!.%1~.%~)$(git_prompt_info)%{$reset_color%}$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
