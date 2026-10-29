#!/bin/sh
# Rectangle with my window shortcuts (carried over from SizeUp). Safe to re-run; a running Rectangle picks the change up.
# Key codes: ← 123, → 124, ↓ 125, ↑ 126, C 8, M 46, / 44. Modifiers: ⌃⌥⌘ 1835008, ⌥⌘ 1572864, ⌃⌥ 786432.
# Rectangle takes ⌥⌘ ←/→ from every app, so they no longer switch tabs in Chrome or VS Code, or panes in iTerm2.
# SizeUp's four "send to Space" shortcuts (⌃⌘ arrows) have no match: Rectangle can't move windows between Spaces.
set -e
D=com.knollsoft.Rectangle
key() { defaults write $D "$1" -dict-add keyCode -float "$2" modifierFlags -float "$3"; }

key leftHalf        123 1835008  # ⌃⌥⌘ ←
key rightHalf       124 1835008  # ⌃⌥⌘ →
key topHalf         126 1835008  # ⌃⌥⌘ ↑
key bottomHalf      125 1835008  # ⌃⌥⌘ ↓
key topLeft         123 1572864  # ⌥⌘ ←
key topRight        126 1572864  # ⌥⌘ ↑
key bottomLeft      125 1572864  # ⌥⌘ ↓
key bottomRight     124 1572864  # ⌥⌘ →
key maximize        46  1835008  # ⌃⌥⌘ M
key center          8   1835008  # ⌃⌥⌘ C
key restore         44  1835008  # ⌃⌥⌘ /
key nextDisplay     124 786432   # ⌃⌥ →
key previousDisplay 123 786432   # ⌃⌥ ←

# Off: an empty entry means no shortcut, where a missing one falls back to Rectangle's default
for action in maximizeHeight larger smaller; do defaults write $D "$action" -dict; done

defaults write $D alternateDefaultShortcuts -bool true  # the "Recommended" set for everything not listed here
defaults write $D launchOnLogin -bool true
