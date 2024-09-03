#!/usr/bin/env bash

# # #
# iTerm customizations
#

itermBundleID=$(defaults read /Applications/iTerm.app/Contents/Info.plist CFBundleIdentifier)
# hide menu bar for iTerm app
defaults write ${itermBundleID} AppleMenuBarVisibleInFullscreen -bool false
# defaults read ${itermBundleID} AppleMenuBarVisibleInFullscreen
# defaults delete ${itermBundleID} AppleMenuBarVisibleInFullscreen
