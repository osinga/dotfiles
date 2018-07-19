export ZSH=/Users/Osinga/.oh-my-zsh



################################################################################
# Zsh                                                                          #
################################################################################

# Plugins
plugins=(
    git
    npm
    osx
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

# SSH into the TRVL server
alias trvl='ssh forge@52.214.228.4'

# Direct access to the Dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Add Hub sugar to Git
eval "$(hub alias -s)"



################################################################################
# Export                                                                       #
################################################################################

# fzf
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='ag -g ""'   # Set ag as the default source

# Paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

# Terminal
export CLICOLOR=1                   # Turn colors on
export EDITOR=/usr/local/bin/vim    # Set the default editor
export KEYTIMEOUT=1                 #  Kill the lag
export LSCOLORS=GxFxCxDxBxegedabagaced  # Customize the colors
export VISUAL="$EDITOR"             # Set the default editor

# Vi-mode
autoload -U colors && colors
export MODE_INDICATOR="%{$fg_bold[green]%}[NORMAL]%{$reset_color%}"



################################################################################
# Functions                                                                    #
################################################################################

# Open the provided man page as a PDF in Preview
function manpdf() {
     man -t ${1} | open -f -a /Applications/Preview.app
}



################################################################################
# Source                                                                       #
################################################################################

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
