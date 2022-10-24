#!/usr/bin/env bash

mkdir -p ~/.config

# misc
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/ackrc ~/.ackrc

# fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish

mkdir -p ~/.config/fish/functions
ln -sf $(pwd)/fish/functions/git-trash.fish ~/.config/fish/functions/git-trash.fish
ln -sf $(pwd)/fish/functions/gr.fish ~/.config/fish/functions/gr.fish

fish $(pwd)/fish/abbreviations.fish

# neovim
rm -rf ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim

# install vim-plug
if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# karabiner
mkdir -p ~/.config/karabiner
ln -sf $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json
