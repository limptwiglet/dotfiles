#!/bin/sh

echo "Bootstrapping dot files"

echo "Install NERD fonts"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "JetBrains Mono Nerd Font Complete Regular.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fontsJetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Nerd%20Fon%20Complete%20Regular.ttf
cd ~/.dotfiles

echo "Setup tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ./tmux/.tmux.conf /home/${USER}/.tmux.conf

echo "Setup zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ./zsh/.zshrc /home/${USER}/.zshrc

echo "Setup neovim"
ln -s ./nvim /home/${USER}/.config/nvim

echo "Setup kitty"
ln -s ./kitty /home/${USER}/.config/kitty
