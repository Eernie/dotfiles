#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

brew_install "Android File Transfer" "android-file-transfer" "--cask"
brew_install "Transmission" "transmission" "--cask"
brew_install "VLC" "vlc" "--cask"
