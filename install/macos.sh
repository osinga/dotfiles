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

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Require password immediately after sleep or screen saver begins
defaults write com.apple.Screensaver askForPassword -int 1
defaults write com.apple.Screensaver askForPasswordDelay -int 0

# Show the battery percentage in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -bool true

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
# Top left screen corner → None
defaults write com.apple.Dock wvous-tl-corner -int 0
defaults write com.apple.Dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
#defaults write com.apple.Dock wvous-tr-corner -int 4
#defaults write com.apple.Dock wvous-tr-modifier -int 0
# Bottom left screen corner → Put display to sleep
defaults write com.apple.Dock wvous-bl-corner -int 10
defaults write com.apple.Dock wvous-bl-modifier -int 0



################################################################################
# App Store                                                                    #
################################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1



################################################################################
# Dock                                                                         #
################################################################################

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.Dock tilesize -int 36

# Enable spring loading for all Dock items
defaults write com.apple.Dock enable-spring-load-actions-on-all-items -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.Dock mru-spaces -bool false

# Enable the App Expose gesture
defaults write com.apple.Dock showAppExposeGestureEnabled -bool true

# Wipe all (default) app icons from the Dock
defaults write com.apple.Dock persistent-apps -array

# TODO: Add apps persistent Dock section

# Add a spacer to the left side of the Dock (where the applications are)
defaults write com.apple.Dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.Dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.Dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'



################################################################################
# Finder                                                                       #
################################################################################

# Set Desktop as the default location for new Finder windows
defaults write com.apple.Finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Hide icons for hard drives, removable media, and servers on the desktop
defaults write com.apple.Finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder ShowMountedServersOnDesktop -bool false

# Do not show tags in the sidebar
defaults write com.apple.Finder ShowRecentTags -bool false

# Remove items from the Trash after 30 days
defaults write com.apple.Finder FXRemoveOldTrashItems -bool true

# Keep folders on top when sorting by name
defaults write com.apple.Finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.DesktopServices DSDontWriteNetworkStores -bool true
defaults write com.apple.DesktopServices DSDontWriteUSBStores -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.Finder.plist
#/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.Finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.Finder.plist

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.Finder FXPreferredViewStyle -string "clmv"

# Group files by application
defaults write com.apple.Finder FXPreferredGroupBy -string "Kind"

# Expand the following File Info panes:
defaults write com.apple.Finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Preview -bool true \
    Privileges -bool true



#################################################################################
# Terminal                                                                      #
#################################################################################

# Enable Secure Keyboard Entry in Terminal.app
defaults write com.apple.Terminal SecureKeyboardEntry -bool true

# Hide the line marks
defaults write com.apple.Terminal ShowLineMarks -bool false



################################################################################
# TextEdit								                                       #
################################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -bool false



################################################################################
# Transmission                                                                 #
################################################################################

# Don't prompt on quit with active transfers
defaults write org.m0k.Transmission CheckQuit -bool false

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.Transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
defaults write org.m0k.Transmission DownloadAsk -bool false
defaults write org.m0k.Transmission MagnetOpenAsk -bool false

# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.Transmission CheckRemoveDownloading -bool true

# Trash original torrent files
defaults write org.m0k.Transmission DeleteOriginalTorrent -bool true

# Stop seeding at ratio 2,00
defaults write org.m0k.Transmission RatioCheck -bool true

# Remove from the transfer list when seeding completes
defaults write org.m0k.Transmission RemoveWhenFinishSeeding -bool true

# IP block list
defaults write org.m0k.Transmission BlocklistNew -bool true
defaults write org.m0k.Transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.Transmission BlocklistAutoUpdate -bool true

# Randomize port on launch
defaults write org.m0k.Transmission RandomPort -bool true

# Enable remote access
defaults write org.m0k.Transmission RPC -bool true

# Hide the donate message
defaults write org.m0k.Transmission WarningDonate -bool false

# Hide the legal disclaimer
defaults write org.m0k.Transmission WarningLegal -bool false



################################################################################
# Restart                                                                      #
################################################################################

killall Dock
killall Finder
killall SystemUIServer

echo "Done. Note that some of these changes require a logout/restart to take effect."
