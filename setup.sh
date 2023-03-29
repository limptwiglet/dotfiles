#!/bin/sh

echo "Bootstrapping dot files"

echo "Install NERD fonts"
git clone git@github.com:ryanoasis/nerd-fonts.git ~/.config/nerd-fonts
cd ~/.config/nerd-fonts
./install.sh JetBrainsMono

echo "Setup tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ./tmux/.tmux.conf ~/.tmux.conf

echo "Setup zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ./zsh/.zshrc ~/.zshrc

echo "Setup neovim"
ln -s ./nvim ~/.config/nvim

echo "Setup kitty"
ln -s ./kitty ~/.config/kitty
