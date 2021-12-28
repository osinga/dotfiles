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

# Hot corners
# Possible values:
#     0: no-op
#     1: -
#     2: Mission Control
#     3: Application Windows
#     4: Desktop
#     5: Start Screen Saver
#     6: Disable Screen Saver
#    10: Put Display to Sleep
#    11: Launchpad
#    12: Notification Centre
#    13: Lock Screen
#    14: Quick Note
# Bottom left screen corner → Put Display to Sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Remove Spotlight and Siri from the menu bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true
defaults write com.apple.Siri StatusMenuVisible -bool false



################################################################################
# App Store                                                                    #
################################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1



################################################################################
# Dock                                                                         #
################################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Add a spacer to the left side of the Dock (where the applications are)
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'

# Don't show recent applications
defaults write com.apple.dock show-recents -bool false

# Enable the App Expose gesture
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36



################################################################################
# Finder                                                                       #
################################################################################

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.DesktopServices DSDontWriteNetworkStores -bool true
defaults write com.apple.DesktopServices DSDontWriteUSBStores -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand the following File Info panes:
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Preview -bool true \
    Privileges -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `Flwv`, `Nlsv`, `icnv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Group files by kind
defaults write com.apple.finder FXPreferredGroupBy -string "Kind"

# Remove items from the Trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Set Documents as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Documents/"

# Hide icons for hard drives and servers on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Do not show tags in the sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Create the `Development` folder
mkdir -p ~/Development



################################################################################
# Reminders                                                                    #
################################################################################

# Mute notifications for assigned reminders
defaults write com.apple.remindd enableAssignmentNotifications -bool false



#################################################################################
# Safari                                                                        #
#################################################################################

# Enable the Develop menu and the Web Inspector in Safari
#defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

# Disable AutoFill
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Restore all windows from the last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove history items manually
defaults write com.apple.Safari HistoryAgeInDaysLimit -int 365000

# Set the default search engine to DuckDuckGo
defaults write com.apple.Safari SearchProviderShortName -string "DuckDuckGo"

# Show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Show the status bar
defaults write com.apple.Safari ShowOverlayStatusBar -bool true



#################################################################################
# Terminal                                                                      #
#################################################################################

# Enable Secure Keyboard Entry in Terminal.app
defaults write com.apple.Terminal SecureKeyboardEntry -bool true

# Hide the line marks
defaults write com.apple.Terminal ShowLineMarks -bool false

# Enable italics
tic ~/src/xterm-256color-italic.terminfo

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
    do shell script "open '~/src/" & ThemeName & ".terminal'"

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



################################################################################
# Transmission                                                                 #
################################################################################

# IP block list
defaults write org.m0k.Transmission BlocklistNew -bool true
defaults write org.m0k.Transmission BlocklistURL -string "https://github.com/Naunter/BT_BlockLists/raw/master/bt_blocklists.gz"
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
