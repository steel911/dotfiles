#!/bin/bash
#
# Script to install Steel911's dotfiles
#

# Create working directory if it does't exist
mkdir -p ~/.local/bin

# Download yadm - yet another dotfile manager
curl \
    --proxy "socks5://127.0.0.1:7890"   \
    -sfLo ~/.local/bin/yadm             \
    https://github.com/TheLocehiliosan/yadm/raw/master/yadm

# +Execute permission
chmod u+x ~/.local/bin/yadm

# Clone and bootstrap dotfiles repository
~/.local/bin/yadm clone --bootstrap -f https://github.com/steel911/dotfiles.git

echo "Dotfiles setup completed!"
