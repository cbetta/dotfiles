#!/bin/sh
# Optional: makes macOS quicker on a smaller or older Mac (Razorback: 8 GB M1 on macOS 27). Not run by install.sh.
# Safe to re-run. Undo a line with `defaults delete <domain> <key>`, then `killall Dock Finder`.
set -e

# Quicker window, sheet, Dock, Mission Control, Finder and Quick Look animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.finder DisableAllAnimations -bool true

# Siri off, with "Hey Siri" and its menu bar item
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false

killall Dock Finder 2>/dev/null || true
killall Siri 2>/dev/null || true

# macOS doesn't let a script change these, so they're by hand
cat <<'EOF'
Done. By hand, for the biggest win (Liquid Glass's blur is most of WindowServer's load):
  - System Settings → Accessibility → Display: turn on Reduce transparency
  - System Settings → Accessibility → Motion: turn on Reduce motion
  - iTerm2 → Settings → Profiles → Window: Transparency to 0, untick Blur
EOF
