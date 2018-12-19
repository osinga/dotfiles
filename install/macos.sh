#!/bin/bash

################################################################################
# Setup                                                                        #
################################################################################

# Close any open System Preferences panes to prevent them from overriding
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



################################################################################
# General                                                                      #
################################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Bottom left screen corner → Put display to sleep
defaults write com.apple.Dock wvous-bl-corner -int 10
defaults write com.apple.Dock wvous-bl-modifier -int 0

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.Screensaver askForPassword -int 1
defaults write com.apple.Screensaver askForPasswordDelay -int 0

# Show the battery percentage in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Select dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on



################################################################################
# App Store                                                                    #
################################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1



################################################################################
# Dock                                                                         #
################################################################################

# Enable spring loading for all Dock items
defaults write com.apple.Dock enable-spring-load-actions-on-all-items -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.Dock mru-spaces -bool false

# Wipe all (default) app icons from the Dock
defaults write com.apple.Dock persistent-apps -array

# TODO: Add apps persistent Dock section

# Add a spacer to the left side of the Dock (where the applications are)
defaults write com.apple.Dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.Dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Don't show recent applications
defaults write com.apple.Dock show-recents -bool false

# Enable the App Expose gesture
defaults write com.apple.Dock showAppExposeGestureEnabled -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.Dock tilesize -int 36



################################################################################
# Finder                                                                       #
################################################################################

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.Finder.plist
#/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.Finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.Finder.plist

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.DesktopServices DSDontWriteNetworkStores -bool true
defaults write com.apple.DesktopServices DSDontWriteUSBStores -bool true

# Keep folders on top when sorting by name
defaults write com.apple.Finder _FXSortFoldersFirst -bool true

# Expand the following File Info panes:
defaults write com.apple.Finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Preview -bool true \
    Privileges -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.Finder FXPreferredViewStyle -string "clmv"

# Group files by application
defaults write com.apple.Finder FXPreferredGroupBy -string "Kind"

# Remove items from the Trash after 30 days
defaults write com.apple.Finder FXRemoveOldTrashItems -bool true

# Set Desktop as the default location for new Finder windows
defaults write com.apple.Finder NewWindowTargetPath -string "file://${HOME}/Google Drive/"

# Hide icons for hard drives, removable media, and servers on the desktop
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.Finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.Finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool false

# Do not show tags in the sidebar
defaults write com.apple.Finder ShowRecentTags -bool false



#################################################################################
# Network                                                                       #
#################################################################################

# Use Cloudflare's DNS servers
networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1



#################################################################################
# Siri                                                                          #
#################################################################################

# Hide the status menu icon
defaults write com.apple.Siri StatusMenuVisible -bool false



#################################################################################
# Terminal                                                                      #
#################################################################################

# Enable Secure Keyboard Entry in Terminal.app
defaults write com.apple.Terminal SecureKeyboardEntry -bool true

# Hide the line marks
defaults write com.apple.Terminal ShowLineMarks -bool false

# Set my custom theme as the default
osascript <<EOD
tell application "Terminal"
    local InitiallyOpenedWindows
    local AllOpenedWindows
    local WindowID

    set ThemeName to "One Dark"

    -- Get the IDs of all open Terminal windows
    set InitiallyOpenedWindows to id of every window

    -- Add the custom theme
    do shell script "open '$HOME/install/" & ThemeName & ".terminal'"

    -- Wait to ensure the theme has been hadded
    delay 1

    -- Set the default Terminal theme
    set default settings to settings set ThemeName

    -- Get the IDs of all open Terminal windows
    set AllOpenedWindows to id of every window

    repeat with WindowID in AllOpenedWindows
        if InitiallyOpenedWindows does not contain WindowID then
            -- Close the aditionally opened windows
            close (every window whose id is WindowID)
        else
            -- Change the initially opened window's theme
            set current settings of tabs of (every window whose id is WindowID) to settings set ThemeName
        end if
    end repeat
end tell
EOD

# Set zsh as the default shell
echo $(which zsh) >> /etc/shells
chsh -s $(which zsh)

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



################################################################################
# TextEdit                                                                     #
################################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -bool false



################################################################################
# tmux                                                                         #
################################################################################

# Install TMP
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install plugins
~/.tmux/plugins/tpm/bin/install_plugins



################################################################################
# Transmission                                                                 #
################################################################################

# IP block list
defaults write org.m0k.Transmission BlocklistNew -bool true
defaults write org.m0k.Transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.Transmission BlocklistAutoUpdate -bool true

# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.Transmission CheckRemoveDownloading -bool true

# Don't prompt on quit with active transfers
defaults write org.m0k.Transmission CheckQuit -bool false

# Trash original torrent files
defaults write org.m0k.Transmission DeleteOriginalTorrent -bool true

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.Transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
defaults write org.m0k.Transmission DownloadAsk -bool false
defaults write org.m0k.Transmission MagnetOpenAsk -bool false

# Enable remote access
defaults write org.m0k.Transmission RPC -bool true

# Randomize port on launch
defaults write org.m0k.Transmission RandomPort -bool true

# Stop seeding at ratio 2,00
defaults write org.m0k.Transmission RatioCheck -bool true

# Remove from the transfer list when seeding completes
defaults write org.m0k.Transmission RemoveWhenFinishSeeding -bool true

# Hide the donate message
defaults write org.m0k.Transmission WarningDonate -bool false

# Hide the legal disclaimer
defaults write org.m0k.Transmission WarningLegal -bool false



################################################################################
# Vim                                                                          #
################################################################################

# Create the necessary directories
mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim +PlugInstall +qall



################################################################################
# Restart                                                                      #
################################################################################

killall Dock
killall Finder
killall SystemUIServer
