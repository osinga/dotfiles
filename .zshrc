export ZSH=/Users/Osinga/.oh-my-zsh



####################################
# zsh
####################################

# Plugins
plugins=(git nyan vagrant zsh-syntax-highlighting)

# Settings
ZSH_THEME="osinga"                  # Set the terminal theme
ENABLE_CORRECTION="true"            # Enable command auto-correction
DISABLE_AUTO_TITLE="true"           # Disable auto-setting the terminal title



####################################
# Aliases
####################################

# Files
alias zshconfig="vim ~/.zshrc"      # Open .zshrc
alias ohmyzsh="vim ~/.oh-my-zsh"    # Open .oh-my-zsh

# Commands
eval "$(thefuck --alias fuck)"      # Natural autocorrect
alias tinker="php artisan tinker"   # Start a tinker session
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"



####################################
# Export
####################################

# Paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

# Terminal
export CLICOLOR=1                   # Turn colors on
export LSCOLORS=GxFxCxDxBxegedabagaced  # Customize the colors



####################################
# Source
####################################

source $ZSH/oh-my-zsh.sh
