#!/usr/bin/env bash

mkdir -p ~/.config

# misc
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/ackrc ~/.ackrc
ln -sf $(pwd)/ignore ~/.ignore
ln -sf $(pwd)/cvsignore ~/.cvsignore

# fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish

mkdir -p ~/.config/fish/functions
for f in `ls -1 $(pwd)/fish/functions`; do
  ln -sf $(pwd)/fish/functions/$(basename $f) ~/.config/fish/functions/$(basename $f)
done

fish $(pwd)/fish/variables.fish
fish $(pwd)/fish/abbreviations.fish

ln -sf $(pwd)/starship.toml ~/.config/starship.toml

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
