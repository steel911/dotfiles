#!/usr/bin/env bash
#
# Script to install Steel911's dotfiles
#
PROXY="socks5://127.0.0.1:7890"
yadm_url="https://github.com/TheLocehiliosan/yadm/raw/master/yadm"
yadm_local_bin="/usr/local/bin/yadm"

# Shortcuts at hand
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
GIT_ROOT=$(git rev-parse --show-toplevel)

## Colorize output.
# shellcheck disable=SC2034
red="\033[91m"
# shellcheck disable=SC2034
green="\033[92m"
# shellcheck disable=SC2034
blue="\033[94m"
# shellcheck disable=SC2034
yellow="\033[93m"
# shellcheck disable=SC2034
white="\033[97m"
# shellcheck disable=SC2034
no_color="\033[0m"

print_msg() {
    echo -e "${green}=>${no_color}${white}" "${@}" "${no_color}" >&1
}

proxy_options() {
    echo -e "${yellow}Options for Proxy Setting.${no_color}" >&1
    echo -e "${yellow}  1)${white} None. Do not setup any proxy.${no_color}" >&1
    echo -e "${yellow}  2)${white} Proxy - socks5://127.0.0.1:7890.${no_color}" >&1
    echo
}

# Download fonts under .local/fonts
# For terminal use  - Space Mono
# For IDE use       - JetBrains Mono
install_yadm() {
    mkdir -p /usr/local/bin
    curl -fLo "${yadm_local_bin}" "${yadm_url}" --proxy $PROXY \
        && chmod a+x "${yadm_local_bin}"
}

# Main
print_msg "Dotfiles setup begins."

# print_msg "Downloading yadm into /usr/local/bin..."
# install_yadm

print_msg "Cleaning ~/.config"
rm -rf $HOME/.config

print_msg "Copy Dotfiles to $HOME/.config"
cd $GIT_ROOT && cp -r .config "${HOME}"

# Clone and bootstrap dotfiles repository
yadm bootstrap

print_msg "Dotfiles setup completed!"
