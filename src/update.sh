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
vim +CocUpdate +PlugUpgrade +PlugUpdate +qall       # Update all Vim plugins

# tmux
~/.config/tmux/plugins/tpm/bin/update_plugins all   # Update all tmux plugins
