local ret_status="%(?:%{$fg_bold[white]%}λ :%{$fg_bold[gray]%}λ )%{$reset_color%}"
PROMPT='${ret_status}%c$(git_prompt_info)> %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}@%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%} %{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%}"
