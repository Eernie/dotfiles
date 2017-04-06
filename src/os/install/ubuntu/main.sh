#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apps() {

    # Install tools for compiling/building software from source.

    install_package "Build Essential" "build-essential"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # GnuPG archive keys of the Debian archive.

    install_package "GnuPG archive keys" "debian-archive-keyring"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons.

    #install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"

    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "google-chrome-stable"; then

        add_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" \
            || print_error "Chrome Canary (add key)"

        add_to_source_list "[arch=amd64] https://dl.google.com/linux/deb/ stable main" "google-chrome.list" \
            || print_error "Chrome (add to package resource list)"

        update &> /dev/null \
            || print_error "Chrome (resync package index files)"

    fi

    install_package "Chrome" "google-chrome-stable"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "enpass"; then

        add_key "https://dl.sinew.in/keys/enpass-linux.key" \
            || print_error "Enpass (add key)"

        add_to_source_list "http://repo.sinew.in/ stable main" "enpass.list" \
            || print_error "Enpass (add to package resource list)"

        update &> /dev/null \
            || print_error "Enpass (resync package index files)"

    fi

    install_package "Enpass" "enpass"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "yarn"; then

        add_key "https://dl.yarnpkg.com/debian/pubkey.gpg" \
            || print_error "Yarn (add key)"

        add_to_source_list "https://dl.yarnpkg.com/debian/ stable main" "yarn.list" \
            || print_error "Yarn (add to package resource list)"

        update &> /dev/null \
            || print_error "Yarn (resync package index files)"

    fi

    install_package "Yarn" "yarn"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "spotify-client"; then

        add_key_raw "hkp://keyserver.ubuntu.com:80" "BBEBDCB318AD50EC6865090613B00F1FD2C19886" \
            || print_error "Spotify (add key)"

        add_to_source_list "http://repository.spotify.com stable non-free" "spotify.list" \
            || print_error "Spotify (add to package resource list)"

        update &> /dev/null \
            || print_error "Spotify (resync package index files)"

    fi

    install_package "Spotify" "spotify-client"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "oracle-java8-installer"; then

        add_ppa "webupd8team/java" \
            || print_error "Java8 (add key)"

        update &> /dev/null \
            || print_error "Java8 (resync package index files)"

	echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections

	echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

    fi

    install_package "Java8" "oracle-java8-installer"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "atom"; then

        add_ppa "webupd8team/atom" \
            || print_error "Atom (add key)"

        update &> /dev/null \
            || print_error "Atom (resync package index files)"

    fi

    install_package "Atom" "atom"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Maven" "maven"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "cURL" "curl"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GIMP" "gimp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "ShellCheck" "shellcheck"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Transmission" "transmission"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "VLC" "vlc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "xclip" "xclip"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Terminator" "terminator"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Zsh" "zsh"

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
	execute "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh" "Oh-My-zsh"
        chsh -s /bin/zsh
    else
        print_success "Oh-My-zsh"
    fi
}

main() {

    print_in_purple "   Miscellaneous\n\n"

    update
    upgrade
    printf "\n"
    install_apps
    printf "\n"
    autoremove

}

main
