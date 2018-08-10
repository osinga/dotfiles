#!/bin/bash

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
