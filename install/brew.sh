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
brew install cmake                  # Install CMake
brew install coreutils              # Install GNU command line tools
brew install curl                   # Transfer data
brew install fzf                    # Fuzzy file finder
brew install git                    # Version control
brew install htop                   # Interactive process viewer
brew install httpie                 # Modern HTTP client
brew install hub                    # Sugar for Git
brew install macvim --with-override-system-vim  # Use MacVim in the terminal
brew install mongodb                # NoSQL database
brew install mysql                  # MySQL
brew install node                   # JavaScript runtime environment
brew install php                    # PHP
brew install python                 # Python
brew install reattach-to-user-namespace         # macOS pasteboard access in tmux
brew install the_silver_searcher    # Search through source code
brew install tldr                   # Simplified man pages
brew install tmux                   # Terminal multiplexer
brew install wget                   # Download Web files
brew install wifi-password          # Wi-Fi password
brew install zsh                    # Alternative shell
brew install zsh-completions        # Additional Zsh completions

# Cleanup
brew cleanup                        # Remove cached downloads and old versions



################################################################################
# Applications                                                                 #
################################################################################

# Setup
brew tap homebrew/cask              # Tap Homebrew Cask

# Install
brew cask install 1password         # 1Password
brew cask install alfred            # Alfred
brew cask install appcleaner        # AppCleaner
brew cask install calibre           # Calibre
brew cask install dropbox           # Dropbox
brew cask install firefox           # Firefox
brew cask install google-backup-and-sync    # Google Backup and Sync
brew cask install google-chrome     # Google Chrome
brew cask install imageoptim        # ImageOptim
brew cask install insomnia          # Insomnia
brew cask install karabiner-elements        # Karabiner Elements
brew cask install keepingyouawake   # KeepingYouAwake
brew cask install licecap           # LICEcap
brew cask install ngrok             # ngrok
brew cask install opera             # Opera
brew cask install robo-3t           # Robo 3T
brew cask install sequel-pro        # Sequel Pro
brew cask install slack             # Slack
brew cask install spotify           # Spotify
brew cask install telegram          # Telegram
brew cask install torbrowser        # TorBrowser
brew cask install transmission      # Transmission
brew cask install vlc               # VLC
brew cask install whatsapp          # WhatsApp



################################################################################
# Fonts                                                                        #
################################################################################

# Setup
brew tap homebrew/cask-fonts        # Tap Homebrew Fonts

# Install
brew cask install font-iosevka                      # Iosevka
brew cask install font-open-sans                    # Open Sans

# Cleanup
brew cask cleanup                   # Remove cached downloads and tracker symlinks



################################################################################
# Services                                                                     #
################################################################################

# Setup
brew tap homebrew/services          # Tap Homebrew Services

# Start
brew services start mongodb         # MongoDB
brew services start mysql           # MySQL
