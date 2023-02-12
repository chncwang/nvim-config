#/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy init.vim to ~/.config/nvim/init.vim
cp init.vim ~/.config/nvim/init.vim

os=$(uname -s | tr '[:upper:]' '[:lower:]')

if [ "$os" != "darwin" ]; then
    cp MONACO.TTF ~/.fonts
fi

nvim +PlugInstall +qall
