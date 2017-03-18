#!/bin/bash

################################################################################
# Homebrew                                                                     #
################################################################################

# Install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update
brew update                         # Update to the latest version of Homebrew
brew upgrade                        # Upgrade any already-installed formulae



################################################################################
# Packages                                                                     #
################################################################################

# Install
brew install ack                    # Search through source code
brew install coreutils              # Install GNU command line tools
brew install cowsay                 # Generate ASCII pictures
brew install curl                   # Transfer data
brew install fortune                # Display a random message
brew install git                    # Version control
brew install httpie                 # Modern HTTP client
brew install macvim --with-override-system-vim  # Use MacVim in the terminal
brew install mongodb                # NoSQL database
brew install node                   # JavaScript runtime environment
brew install php71                  # PHP 7.1
brew install python3                # Python 3
brew install reattach-to-user-namespace         # macOS pasteboard access in tmux
brew install tmux                   # Terminal multiplexer
brew install tree                   # Recursive directory listing
brew install wget                   # Download Web files
brew install zsh                    # Alternative shell
brew install zsh-completions        # Additional Zsh completions

# Cleanup
brew cleanup                        # Remove cached downloads and old versions



################################################################################
# Applications                                                                 #
################################################################################

# Setup
brew tap caskroom/cask              # Tap Homebrew Cask

# Install
brew cask install alfred            # Alfred
brew cask install appcleaner        # AppCleaner
brew cask install atom              # Atom
brew cask install calibre           # Calibre
brew cask install dropbox           # Dropbox
brew cask install firefox           # Firefox
brew cask install flux              # Flux
brew cask install google-chrome     # Google Chrome
brew cask install google-drive      # Google Drive
brew cask install jadengeller-helium    # Helium
brew cask install keepingyouawake   # KeepingYouAwake
brew cask install licecap           # LICEcap
brew cask install postman           # Postman
brew cask install robomongo         # Robomongo
brew cask install sequel-pro        # Sequel Pro
brew cask install spotify           # Spotify
brew cask install sublime-text      # Sublime Text
brew cask install torbrowser        # TorBrowser
brew cask install transmission      # Transmission
brew cask install transmit          # Transmit
brew cask install vlc               # VLC

# Cleanup
brew cask cleanup                   # Remove cached downloads and tracker symlinks



################################################################################
# Services                                                                     #
################################################################################

# Setup
brew tap homebrew/services          # Tap Homebrew Services

# Start
brew services start mongodb         # MongoDB