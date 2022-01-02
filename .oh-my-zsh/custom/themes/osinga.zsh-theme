MODE_INDICATOR="%B%F{black}%K{green} NORMAL %b%f%k"

PROMPT='%F{yellow}%2~ %F{15}$%b '
RPROMPT='$(vi_mode_prompt_info) $(git_prompt_info)'

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" \ue0a0"
