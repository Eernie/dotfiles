#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

brew_install "ShellCheck" "shellcheck"
#brew_install "Visual Studio Code" "visual-studio-code" "homebrew/cask" "cask"
brew_install "Intellij" "intellij-idea" "homebrew/cask" "cask"
brew_install "VyprVPN" "vyprvpn" "homebrew/cask" "cask"
brew_install "Enpass" "enpass" "homebrew/cask" "cask"
brew_install "Iterm2" "iterm2" "homebrew/cask" "cask"
brew_install "Spotify" "spotify" "homebrew/cask" "cask"
brew_install "Zsh" "zsh"

if [! -d "$HOME/.oh-my-zsh"]; then
    execute "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" \"\" --unattende" "Oh-My-Zsh"
else
    print_success "Oh-My-Zsh"
fi

if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn"
fi
