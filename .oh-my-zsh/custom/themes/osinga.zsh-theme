ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

PROMPT='%{$fg[yellow]%}%2~ %{$fg[white]%}$%b '
RPROMPT='$(vi_mode_prompt_info) $(git_prompt_info)'
