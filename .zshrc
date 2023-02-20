################################################################################
# Oh My Zsh                                                                    #
################################################################################

# Plugins
plugins=(
    git
    vi-mode
)

# Settings
export ZSH=~/.oh-my-zsh                                  # Set the folder path
export ZSH_THEME=osinga                                  # Set the terminal theme



################################################################################
# Aliases                                                                      #
################################################################################

# Go to the Development directory
alias dev='cd ~/Developer'

# Direct access to the Dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Update all apps, tools, and plugins
alias update='~/src/update.sh'

# Vim-style exit
alias :q='exit'

# JD navigation
function cd() {
    # If arg is "AC.ID.NN" go to NN folder
    if [[ $1 =~ '^[0-9]{2}\.[0-9]{2}\.[0-9]{2}$' ]]; then
        builtin cd ~/Documents/*/*/*/${1}*/

    # If arg is "AC.ID" go to ID folder
    elif [[ $1 =~ '^[0-9]{2}\.[0-9]{2}$' ]]; then
        builtin cd ~/Documents/*/*/${1}*/

    # If arg is "AC-AC" go to Area folder
    elif [[ $1 =~ '^[0-9]{2}-[0-9]{2}$' ]]; then
        builtin cd ~/Documents/${1}*/; ls -lh

    # If arg is "AC" go to Category folder
    elif [[ $1 =~ '^[0-9]{2}$' ]]; then
        builtin cd ~/Documents/*/${1}*/; ls -lh

    # Otherwise call `cd` normally
    else
        builtin cd "$@"
    fi
}



################################################################################
# Export                                                                       #
################################################################################

# fzf
export FZF_COMPLETION_OPTS='--preview "cat {}"'     # Add a preview window
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'      # Set the default source
export FZF_DEFAULT_OPTS='--border --color=16,border:7 --layout=reverse --margin=0,1'

# Terminal
export KEYTIMEOUT=1                                 # Kill the lag
export TERM=xterm-256color-italic                   # Enable italics



################################################################################
# Source                                                                       #
################################################################################

source $ZSH/oh-my-zsh.sh
source ~/.config/op/plugins.sh
source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
