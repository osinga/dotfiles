################################################################################
# Homebrew                                                                     #
################################################################################

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



################################################################################
# Packages                                                                     #
################################################################################

# Install
brew install fzf                            # Fuzzy file finder
brew install git                            # Version control
brew install gh                             # GitHub CLI
brew install httpie                         # Modern HTTP client
brew install jq                             # JSON processor
brew install mysql                          # MySQL
brew install node                           # Node.js
brew install postgresql                     # PostgresQL
brew install the_silver_searcher            # Search through source code
brew install tldr                           # Simplified man pages
brew install tmux                           # Terminal multiplexer
brew install vim                            # Use up-to-date vim
brew install zsh-completions                # Additional Zsh completions



################################################################################
# Applications                                                                 #
################################################################################

# Install
brew install --cask 1password               # 1Password
brew install --cask adguard                 # AdGuard
brew install --cask alfred                  # Alfred
brew install --cask calibre                 # Calibre
brew install --cask firefox                 # Firefox
brew install --cask google-chrome           # Google Chrome
brew install --cask imageoptim              # ImageOptim
brew install --cask insomnia                # Insomnia
brew install --cask karabiner-elements      # Karabiner Elements
brew install --cask keyboard-maestro        # Keyboard Maestro
brew install --cask notion                  # Notion
brew install --cask pock                    # Pock
brew install --cask slack                   # Slack
brew install --cask soda-player             # Soda Player
brew install --cask spotify                 # Spotify
brew install --cask tableplus               # TablePlus
brew install --cask tor-browser             # Tor Browser
brew install --cask transmission            # Transmission
brew install --cask visual-studio-code      # Visual Studio Code
brew install --cask whatsapp                # WhatsApp
brew install --cask zotero                  # Zotero



################################################################################
# Fonts                                                                        #
################################################################################

# Setup
brew tap homebrew/cask-fonts                # Tap Homebrew Fonts

# Install
brew install font-iosevka                   # Iosevka



################################################################################
# Services                                                                     #
################################################################################

# Start
brew services start mysql                   # MySQL
brew services start postgresql              # PostgresQL
