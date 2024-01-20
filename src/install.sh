################################################################################
# Set up                                                                       #
################################################################################

# Clone the dotfiles into a bare repository
git clone --bare https://github.com/osinga/dotfiles.git ~/.dotfiles

# Define the alias in the current shell scope
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the content from the bare repository
dotfiles checkout --force

# Set the `showUntrackedFiles` flag for this clone
dotfiles config --local status.showUntrackedFiles no

# Hide the `src` folder
chflags hidden ~/src



################################################################################
# Install                                                                      #
################################################################################

# General
[[ ! -v CI ]] && sudo softwareupdate -i -a    # Update App Store applications

# Specific
source ~/src/brew.sh                # Install Homebrew and related components
source ~/src/macos.sh               # Set macOS specific settings
source ~/src/node.sh                # Update npm and install global packages
