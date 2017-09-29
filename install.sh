

cd $HOME
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

export DEV="/mnt/d/Documents/Development"
rm "$HOME/.bashrc"
ln -s "$DEV/src/Dotfiles/shell/.bashrc" "$HOME/.bashrc"
rm -rf "$HOME/.bash"
ln -s "$DEV/src/Dotfiles/shell/.bash" "$HOME"
rm -rf "$HOME/.config/"
ln -s "$DEV/src/Dotfiles/vim/.config/" "$HOME"