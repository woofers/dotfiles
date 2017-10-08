sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-pip
sudo pip install powerline-shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# sudo apt-get install tmux

# wget https://github.com/libevent/libevent/releases/download/# release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
# tar -zxvf libevent-2.1.8-stable.tar.gz
# cd libevent-2.1.8-stable
# ./configure --prefix=/opt/libevent
# make
# sudo make install

sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev

cd $HOME
wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
tar -zxvf tmux-2.5.tar.gz
cd tmux-2.5
./configure && make
sudo make install
rm -rf tmux-2.5

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

tmux
tmux show -g | cat > ~/.tmux.conf
exit

export DEV="/mnt/d/Documents/Development"
rm "$HOME/.bashrc"
ln -s "$DEV/src/Dotfiles/shell/.bashrc" "$HOME/.bashrc"
rm -rf "$HOME/.bash"
ln -s "$DEV/src/Dotfiles/shell/.bash" "$HOME"
rm "$HOME/.zshrc"
ln -s "$DEV/src/Dotfiles/shell/.zshrc" "$HOME/.zshrc"
rm -rf "$HOME/.oh-my-zsh/themes"
ln -s "$DEV/src/Dotfiles/shell/.oh-my-zsh/themes" "$HOME/.oh-my-zsh/"
rm -rf "$HOME/.tmux"
ln -s "$DEV/src/Dotfiles/tmux/.tmux" "$HOME"
rm "$HOME/.tmux.conf"
ln -s "$DEV/src/Dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
rm -rf "$HOME/.config/"
ln -s "$DEV/src/Dotfiles/vim/.config/" "$HOME"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
