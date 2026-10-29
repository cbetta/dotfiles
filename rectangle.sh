#!/bin/sh
# Rectangle with the shortcuts I had in SizeUp. Safe to re-run; a running Rectangle picks the change up.
# Key codes: ← 123, → 124, ↓ 125, ↑ 126, C 8, M 46, / 44. Modifiers: ⌃⌥⌘ 1835008, ⇧⌃⌥ 917504, ⌃⌥ 786432.
# SizeUp's four "send to Space" shortcuts (⌃⌘ arrows) have no match: Rectangle can't move windows between Spaces.
set -e
D=com.knollsoft.Rectangle
key() { defaults write $D "$1" -dict-add keyCode -float "$2" modifierFlags -float "$3"; }

key leftHalf        123 1835008  # ⌃⌥⌘ ←
key rightHalf       124 1835008  # ⌃⌥⌘ →
key topHalf         126 1835008  # ⌃⌥⌘ ↑
key bottomHalf      125 1835008  # ⌃⌥⌘ ↓
key topLeft         123 917504   # ⇧⌃⌥ ←
key topRight        126 917504   # ⇧⌃⌥ ↑
key bottomLeft      125 917504   # ⇧⌃⌥ ↓
key bottomRight     124 917504   # ⇧⌃⌥ →
key maximize        46  1835008  # ⌃⌥⌘ M
key center          8   1835008  # ⌃⌥⌘ C
key restore         44  1835008  # ⌃⌥⌘ /
key nextDisplay     124 786432   # ⌃⌥ →
key previousDisplay 123 786432   # ⌃⌥ ←

# Rectangle's own defaults for these land on the ⇧⌃⌥ arrows above, so clear them: an empty entry means no shortcut
for action in maximizeHeight larger smaller; do defaults write $D "$action" -dict; done

defaults write $D alternateDefaultShortcuts -bool true  # the "Recommended" set for everything not listed here
defaults write $D launchOnLogin -bool true
