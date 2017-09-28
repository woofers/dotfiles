sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-pip
sudo pip install powerline-shell


cd $HOME

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

ln -s "$DEV/src/Dotfiles/shell/.bashrc" "$HOME/.bashrc"
ln -s "$DEV/src/Dotfiles/shell/.bash" "$HOME"
ln -s "$DEV/src/Dotfiles/vim/.config/" "$HOME"