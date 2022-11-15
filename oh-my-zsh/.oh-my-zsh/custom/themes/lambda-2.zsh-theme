local ret_status="%(?:%{$fg_bold[white]%}λ :%{$fg_bold[gray]%}λ )"
PROMPT='${ret_status}$(git_prompt_info)%{$fg[white]%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}@ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%} %{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%}"
