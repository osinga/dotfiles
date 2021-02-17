################################################################################
# Homebrew                                                                     #
################################################################################

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



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
brew install zsh-completions        # Additional Zsh completions



################################################################################
# Applications                                                                 #
################################################################################

# Install
brew install 1password              # 1Password
brew install adguard                # AdGuard
brew install alfred                 # Alfred
brew install calibre                # Calibre
brew install firefox                # Firefox
brew install google-chrome          # Google Chrome
brew install imageoptim             # ImageOptim
brew install insomnia               # Insomnia
brew install karabiner-elements     # Karabiner Elements
brew install keyboard-maestro       # Keyboard Maestro
brew install notion                 # Notion
brew install pock                   # Pock
brew install slack                  # Slack
brew install soda-player            # Soda Player
brew install spotify                # Spotify
brew install tableplus              # TablePlus
brew install tor-browser            # Tor Browser
brew install transmission           # Transmission
brew install visual-studio-code     # Visual Studio Code
brew install whatsapp               # WhatsApp
brew install zotero                 # Zotero



################################################################################
# Fonts                                                                        #
################################################################################

# Setup
brew tap homebrew/cask-fonts        # Tap Homebrew Fonts

# Install
brew install font-iosevka           # Iosevka
brew install font-open-sans         # Open Sans



################################################################################
# Services                                                                     #
################################################################################

# Start
brew services start mysql           # MySQL
brew services start postgresql      # PostgresQL
