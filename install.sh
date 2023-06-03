#!/bin/bash

set -e

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' || { echo "Failed to download vim-plug"; exit 1; }

# Copy init.vim to ~/.config/nvim/init.vim
cp init.vim ~/.config/nvim/init.vim || { echo "Failed to copy init.vim"; exit 1; }

os=$(uname -s | tr '[:upper:]' '[:lower:]')

if [ "$os" != "darwin" ]; then
    cp MONACO.TTF ~/.fonts || { echo "Failed to copy MONACO.TTF"; exit 1; }
fi

nvim +PlugInstall +qall || { echo "Failed to install plugins"; exit 1; }
nvim +Copilot setup +qall || { echo "Failed to setup Copilot"; exit 1; }
