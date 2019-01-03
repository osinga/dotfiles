#!/bin/bash

################################################################################
# Set up                                                                       #
################################################################################

# Clone the dotfiles into a bare repository
git clone --bare https://github.com/osinga/dotfiles.git ~/.dotfiles

# Define the alias in the current shell scope
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the content from the bare repository
dotfiles checkout

# Set the `showUntrackedFiles` flag for this clone
dotfiles config --local status.showUntrackedFiles no



################################################################################
# Install                                                                      #
################################################################################

# General
sudo softwareupdate -i -a           # Update App Store applications
xcode-select --install              # Install the Xcode command line tools

# Specific
source brew.sh                      # Install Homebrew and related components
source macos.sh                     # Set macOS specific settings
source node.sh                      # Update npm and install global packages
