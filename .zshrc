export ZSH=/Users/Osinga/.oh-my-zsh



################################################################################
# Zsh                                                                          #
################################################################################

# Plugins
plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
)

# Settings
DISABLE_AUTO_TITLE='true'           # Disable auto-setting the terminal title
ZSH_THEME='osinga'                  # Set the terminal theme



################################################################################
# Aliases                                                                      #
################################################################################

# Go to the Development directory
alias dev='cd ~/Development'

# Direct access to the Dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Update macOS, Homebrew, Node, and Vim
alias update='~/src/update.sh'

# Vim-style exit
alias :q='exit'

# Open Vim with Codi
# Usage: codi [filetype]
function codi() {
    vim -c "
        highlight NonText ctermfg=0
        let g:codi#rightsplit=0
        set bt=nofile showtabline=0
        startinsert
        Codi ${1:-javascript}
    "
}



################################################################################
# Export                                                                       #
################################################################################

# fzf
export FZF_COMPLETION_OPTS='--preview "cat {}"'     # Add a preview window
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'      # Set the default source
export FZF_DEFAULT_OPTS='--layout=reverse'          # Top to bottom

# Paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Terminal
export CLICOLOR=1                                   # Turn colors on
export EDITOR=/usr/local/bin/vim                    # Set the default editor
export KEYTIMEOUT=1                                 # Kill the lag
export LSCOLORS=GxFxCxDxBxegedabagaced              # Customize the colors
export TERM=xterm-256color-italic                   # Enable italics
export VISUAL="$EDITOR"                             # Set the default editor

# vi-mode
autoload -U colors && colors
export MODE_INDICATOR="%{$bg[green]%}%{$fg_bold[black]%} NORMAL %{$reset_color%}"



################################################################################
# Source                                                                       #
################################################################################

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
