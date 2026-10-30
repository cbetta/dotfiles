#!/bin/sh
# macOS preferences for every Mac. Run by install.sh; safe to re-run. Log out and back in for them to apply everywhere.
set -e

# Fast key repeat, so holding backspace clears text quickly: the quickest the Keyboard settings sliders go
# (KeyRepeat 2 = 30 ms between repeats, InitialKeyRepeat 15 = 225 ms before the first)
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Tap to click, on the built-in trackpad and a Magic Trackpad (System Settings also keeps it per host)
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
