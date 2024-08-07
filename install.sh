#!/bin/bash

set -e

# Check if packer is installed
if [ ! -d "${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  # Install packer
  git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim || { echo "Failed to install packer.nvim"; exit 1; }
fi

# Copy init.lua to ~/.config/nvim/init.lua
cp init.lua ~/.config/nvim/init.lua || { echo "Failed to copy init.lua"; exit 1; }

os=$(uname -s | tr '[:upper:]' '[:lower:]')

if [ "$os" != "darwin" ]; then
    cp MONACO.TTF ~/.fonts || { echo "Failed to copy MONACO.TTF"; exit 1; }
fi
