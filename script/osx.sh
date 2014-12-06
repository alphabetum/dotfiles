#!/usr/bin/env bash

###############################################################################
# UX
###############################################################################

# Reduce Transparency.
# UI location:
#   System Preferences -> Accessibility -> Display -> Reduce Transparency
# Description: Reportedly minimizes performances issues like lagging animations due to
# windowserver getting bloated.
# Note: Requires restart.
# Revert command:
# defaults write com.apple.universalaccess reduceTransparency 0
defaults write com.apple.universalaccess reduceTransparency 1

###############################################################################
# Developer Applications
###############################################################################

# Add iOS Simulator to Launchpad and Spotlight
# Notes: spotlight apparently doesn't index symlinks properly, so an alias is
# required in order to get it picked up properly.
make_alias "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications"

###############################################################################
# Disk Utility
###############################################################################

# Enable the debug menu.
# Revert command:
# defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool false
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

# Enable advanced options
# TODO: this was already set to `"advanced-image-options" = 1`, so the actual
# default will need to be determined.
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
# Finder
###############################################################################

# Finder: allow text selection in Quick Look.
# Revert command:
# defaults delete com.apple.finder QLEnableTextSelection
defaults write com.apple.finder QLEnableTextSelection -bool true

###############################################################################
# Address Book, Dashboard, iCal, TextEdit
###############################################################################

# Enable the debug menu in Address Book.
# Revert command:
# defaults delete com.apple.addressbook ABShowDebugMenu
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
# Revert commands:
# defaults delete com.apple.TextEdit PlainTextEncoding
# defaults delete com.apple.TextEdit PlainTextEncodingForWrite
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Mac App Store
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
# Revert command:
# defaults delete com.apple.appstore WebKitDeveloperExtras
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
# Revert command:
# defaults delete com.apple.appstore ShowDebugMenu
defaults write com.apple.appstore ShowDebugMenu -bool true

###############################################################################
# Kill affected applications
###############################################################################

for app in "Address Book" "Disk Utility" "Finder"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
