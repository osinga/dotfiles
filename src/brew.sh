################################################################################
# Homebrew                                                                     #
################################################################################

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Update
brew update                         # Update to the latest version of Homebrew
brew upgrade                        # Upgrade any already-installed formulae



################################################################################
# Packages                                                                     #
################################################################################

# Install
brew install fzf                    # Fuzzy file finder
brew install git                    # Version control
brew install github/gh/gh           # GitHub CLI
brew install httpie                 # Modern HTTP client
brew install jq                     # JSON processor
brew install mysql                  # MySQL
brew install node                   # Node.js
brew install postgresql             # PostgresQL
brew install reattach-to-user-namespace     # macOS pasteboard access in tmux
brew install the_silver_searcher    # Search through source code
brew install tldr                   # Simplified man pages
brew install tmux                   # Terminal multiplexer
brew install vim                    # Use up-to-date vim
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
brew cask install calibre           # Calibre
brew cask install firefox           # Firefox
brew cask install google-chrome     # Google Chrome
brew cask install imageoptim        # ImageOptim
brew cask install insomnia          # Insomnia
brew cask install karabiner-elements    # Karabiner Elements
brew cask install keyboard-maestro  # Keyboard Maestro
brew cask install notion            # Notion
brew cask install obsidian          # Obsidian
brew cask install pock              # Pock
brew cask install sketch            # Sketch
brew cask install slack             # Slack
brew cask install soda-player       # Soda Player
brew cask install spotify           # Spotify
brew cask install tableplus         # TablePlus
brew cask install telegram          # Telegram
brew cask install tor-browser       # Tor Browser
brew cask install transmission      # Transmission
brew cask install visual-studio-code    # Visual Studio Code
brew cask install whatsapp          # WhatsApp



################################################################################
# Fonts                                                                        #
################################################################################

# Setup
brew tap homebrew/cask-fonts        # Tap Homebrew Fonts

# Install
brew cask install font-iosevka      # Iosevka
brew cask install font-open-sans    # Open Sans

# Cleanup
brew cask cleanup                   # Remove cached downloads and tracker symlinks



################################################################################
# Services                                                                     #
################################################################################

# Setup
brew tap homebrew/services          # Tap Homebrew Services

# Start
brew services start mysql           # MySQL
brew services start postgresql      # PostgresQL
