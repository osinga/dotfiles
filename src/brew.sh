################################################################################
# Homebrew                                                                     #
################################################################################

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



################################################################################
# Packages                                                                     #
################################################################################

# Install
brew install fzf
brew install gh
brew install git
brew install httpie
brew install jq
brew install node
brew install postgresql
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install vim
brew install zsh-completions
brew install zsh-syntax-highlighting



################################################################################
# Applications                                                                 #
################################################################################

# Install
brew install --cask 1password
brew install --cask abstract
brew install --cask adguard
brew install --cask alfred
brew install --cask appcleaner
brew install --cask calibre
brew install --cask firefox
brew install --cask google-chrome
brew install --cask imageoptim
brew install --cask insomnia
brew install --cask karabiner-elements
brew install --cask keyboard-maestro
brew install --cask notion
brew install --cask plex
brew install --cask pock
brew install --cask raycast
brew install --cask sf-symbols
brew install --cask sketch
brew install --cask slack
brew install --cask soda-player
brew install --cask spotify
brew install --cask tableplus
brew install --cask tor-browser
brew install --cask transmission
brew install --cask visual-studio-code
brew install --cask whatsapp
brew install --cask zoom
brew install --cask zotero



################################################################################
# Fonts                                                                        #
################################################################################

# Setup
brew tap homebrew/cask-fonts

# Install
brew install --cask font-iosevka
brew install --cask font-new-york
brew install --cask font-open-sans
brew install --cask font-sf-compact
brew install --cask font-sf-mono
brew install --cask font-sf-pro



################################################################################
# Services                                                                     #
################################################################################

# Start
brew services start postgresql
