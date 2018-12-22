#!/bin/bash

################################################################################
# Update                                                                       #
################################################################################

# App Store
sudo softwareupdate -i -a           # Update App Store applications

# Homebrew
brew update                         # Update to the latest version of Homebrew
brew upgrade                        # Upgrade any already installed formulae
brew cleanup                        # Remove cached downloads and old versions

# Node
npm install npm@latest -g           # Update to the latest version of npm
npm update -g                       # Update all global packages

# Vim
vim +PlugUpgrade +PlugUpdate +qall  # Update vim-plug and all Vim plugins
