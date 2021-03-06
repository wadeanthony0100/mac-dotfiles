#!/usr/bin/env bash

git submodule init
git submodule update

dotfile_location=`pwd`

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -s $dotfile_location/aliases $HOME/.aliases
ln -s $dotfile_location/functions $HOME/.functions
ln -s $dotfile_location/oh-my-zsh $HOME/.oh-my-zsh
ln -s $dotfile_location/zshrc $HOME/.zshrc
ln -s $dotfile_location/tmux.conf $HOME/.tmux.conf
ln -s $dotfile_location/nvim $HOME/.config/nvim
ln -s $dotfile_location/dircolors $HOME/.dircolors
ln -s $dotfile_location/gitignroe $HOME/.gitignore

# Install yarn package manager for JavaScript
curl -o- -L https://yarnpkg.com/install.sh | bash

# Install Homebrew system package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tell Git to acknowledge the global gitignore
git config --global core.excludesfile $HOME/.gitignore
