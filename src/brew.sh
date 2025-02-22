################################################################################
# Homebrew                                                                     #
################################################################################

# Install
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Set up
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/homefolder/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)



################################################################################
# Packages                                                                     #
################################################################################

# Install
brew install fzf
brew install gh
brew install git
brew install httpie
brew install jq
brew install mailpit
brew install node
brew install postgresql@15
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install vim
brew install zsh-syntax-highlighting

# Configure
$(brew --prefix)/opt/fzf/install --all --no-bash --no-update-rc



################################################################################
# Applications                                                                 #
################################################################################

# Install
brew install --cask 1password
brew install --cask appcleaner
brew install --cask figma
brew install --cask firefox
brew install --cask google-chrome
brew install --cask imageoptim
brew install --cask insomnia
brew install --cask karabiner-elements
brew install --cask keyboard-maestro
brew install --cask plex
brew install --cask raycast
brew install --cask sf-symbols
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask tor-browser
brew install --cask transmission
brew install --cask visual-studio-code
brew install --cask whatsapp
brew install --cask zotero



################################################################################
# Fonts                                                                        #
################################################################################

# Set up
brew tap homebrew/cask-fonts

# Install
brew install --cask font-iosevka
brew install --cask font-new-york
brew install --cask font-sf-compact
brew install --cask font-sf-mono
brew install --cask font-sf-pro



################################################################################
# Services                                                                     #
################################################################################

# Start
brew services start mailpit
brew services start postgresql@15
