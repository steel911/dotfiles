# steel911's .dotfiles
> For Mac & Ubuntu, default terminal is good to go.
> For PC, both msys2 and MinGW is tested.

## Install
1. Clone this repo under ~/.config
2. Run ~/.config/dotfiles/.github/bootsrtap.sh
3. Open a new Terminal Window


## __Current Status__
## dotfile management tool
I prefer yadm, since it just rely on bash.

## bash
> Keep using Bash for cross platform compatibility.
including:
1. bash_profile
2. bashrc
3. inputrc
4. bashrc.d/*
5. .tmux.conf (Ubuntu & macOS)

## Theme
For terminal ColorScheme, I used a customized theme called piperita.
For coding ColorScheme, Monokai is used.

You can find a colorscheme file for Mac & PC under .config/colorscheme

## Vim
> Good old Vim

with:
1. CtrlP    - File Search
2. NerdTree - File Navigation
3. Monokai  - A fork of "vim-monokai-tasty'
4. Airline  - Kind of neat looking statusbar

## Fonts
bootstrap.sh will NOT install any font, please choose your favourite fonts.
However, Monaco is recommended with this setup.

- Monaco Nerd for Terminal use, included under ~/.config/dotfiles/.github/fonts.
- Hack Nerd for backup, included under ~/.config/dotfiles/.github/fonts.
- JetBrains Mono for IDE use, not included in this repo.

## Others
- gitignore
- proxy with 7890 as clash's default port
- A Brewfile
