#!/bin/bash
#
# Script to install Steel911's dotfiles
#
BACKUP_DIR="$HOME/dotfiles-backup/"
DIR=$( cd "$( dirname "{BASH_SOURCE[0]}" )" && pwd -P )

link_file () 
{
    local TARGET=".$1"
    if [ -h "$HOME/$TARGET" ]; then                                         # if target file is a symbolic link
        if [ "$(pwd -P $HOME/$TARGET)$TARGET" == $DIR/$TARGET ]; then       # if target file is exactly the same file
            echo "$1 is already linked, skipped..."
        else
            echo "$1 is already a symlink to something else, you might need to fix that..."
        fi
    else
        if [ -a "$HOME/$TARGET" ]; then                                     # if target file exists
            echo "$1 already exists, backing up to $BACKUP_DIR and replacing..."
            if [ $1 == bashrc ] || [ $1 == bash_profile ] || [ $1 == vimrc ]; then
                echo "Linking $1..."
            fi

            if [ -d $BACKUP_DIR ]; then
                echo "Creating backup directory $BACKUP_DIR"
                mkdir $BACKUP_DIR
            fi
            mv $HOME/$TARGET $BACKUP_DIR
        fi

        ln -s $DIR/$1 $HOME/$TARGET
        if [ $? -eq 0 ]; then
            echo "$DIR/$1 sucessfully linked to $HOME/$TARGET"
        else
            echo "$DIR/$1 failed to link to $HOME/$TARGET --> NEED ATTENTION!"
            exit 1
        fi

    fi

}

link_file bash_profile
link_file bashrc
link_file bashrc.d
link_file vimrc
