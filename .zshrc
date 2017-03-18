export ZSH=/Users/Osinga/.oh-my-zsh



################################################################################
# Zsh                                                                          #
################################################################################

# Plugins
plugins=(git nyan zsh-syntax-highlighting)

# Settings
ZSH_THEME='osinga'                  # Set the terminal theme
DISABLE_AUTO_TITLE='true'           # Disable auto-setting the terminal title



################################################################################
# Aliases                                                                      #
################################################################################

# Go to the Development directory
alias dev='cd ~/Development'

# Direct access to the Dotfiles repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'



################################################################################
# Functions                                                                    #
################################################################################

# Open the provided man page as a PDF in Preview
function manpdf() {
     man -t ${1} | open -f -a /Applications/Preview.app
}

# Display a random quote with a random animal with pretty colors
function surprise() {
    fortune -a | cowsay -n -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows/*.cow | gshuf -n1) | lolcat
}



################################################################################
# Export                                                                       #
################################################################################

# Paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH

# Terminal
export EDITOR=/usr/local/bin/vim    # Set the default editor
export VISUAL="$EDITOR"             # Set the default editor
export CLICOLOR=1                   # Turn colors on
export LSCOLORS=GxFxCxDxBxegedabagaced  # Customize the colors



################################################################################
# Source                                                                       #
################################################################################

source $ZSH/oh-my-zsh.sh
