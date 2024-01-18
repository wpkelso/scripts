#!/bin/bash

# This script assumes that the git/backup directory is ~/Documents/configs
# and follows a similar directory hierarchy as wpkelso/configs

VERSION="0.1"
OP_FLAG="BACKUP"

while getopts 'vsb?' OPTION; do
    case "$OPTION" in
        v)
            echo "System/Application Config Update script version $VERSION"
            exit 1
            ;;
        s)
            echo "Using operation: SET"
            OP_FLAG="SET"
            ;;
        b)
            echo "Using operation: BACKUP"
            OP_FLAG="BACKUP"
            ;;
        ?)
            echo "Usage: $(basename $0)" >&2
            ;;
    esac
done

if [ "SET" == $OP_FLAG ]; then
    echo "Beginning operation: SET..."

    echo "[Alacritty] Copying from git dir to local"
    cp -r ~/Documents/configs/alacritty/* ~/.config/alacritty/

    echo "[NVim] Copying from git dir to local"
    cp ~/Documents/configs/nvim/init.lua ~/.config/nvim/

    echo "[TMux] Copying from git dir to local"
    cp ~/Documents/configs/tmux/.tmux.conf ~/

    echo "[zsh] Copying from git dir to local"
    echo "!!! Note: oh-my-zsh should be installed for this config to work"
    cp ~/Documents/configs/zsh/.zshrc ~/

    echo "Set all configs in repo, operation finished"
    exit 1

elif [ "BACKUP" == $OP_FLAG ]; then
    echo "Beginning operation: BACKUP..."

    echo "[Alacritty] Copying from local dir to git"
    cp -r ~/.config/alacritty/* ~/Documents/configs/alacritty/

    echo "[NVim] Copying from local dir to git"
    cp ~/.config/nvim/init.lua ~/Documents/configs/nvim/init.lua

    echo "[TMux] Copying from local dir to git"
    cp ~/.tmux.conf ~/Documents/configs/tmux/

    echo "[zsh] Copying from local dir to git"
    cp ~/.zshrc ~/Documents/configs/zsh/

    echo "Set all configs in repo, operation finished"
    exit 1
fi
