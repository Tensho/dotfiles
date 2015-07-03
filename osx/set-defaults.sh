# Sets reasonable OS X defaults.

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0
