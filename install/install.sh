#!/bin/bash

# General
sudo softwareupdate -i -a           # Update App Store applications
xcode-select --install              # Install the Xcode command line tools

# Install
source brew.sh                      # Install Homebrew and related components
