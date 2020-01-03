#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

brew_install "ShellCheck" "shellcheck"
#brew_install "Visual Studio Code" "visual-studio-code" "homebrew/cask" "cask"
brew_install "Intellij" "intellij"
brew_install "VyprVPN" "vyprvpn"
brew_install "Enpass" "enpass"
brew_install "Zsh" "zsh"

execute "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" \"\" --unattende" "Oh-My-zsh"


if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn"
fi
