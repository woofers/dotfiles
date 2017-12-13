
# Manage Packages
sudo apt-get install software-properties-common

# Install Python
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python-pip

# Install Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Install Bash Powerline
sudo pip install powerline-shell

# Install ZSH and Oh My ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Ctags
sudo apt-get install exuberant-ctags

# Install TMUX
sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
cd $HOME
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -zxvf tmux-2.6.tar.gz
cd tmux-2.6https://github.com/haikarainen/light
./configure && make
sudo make install
cd ..
rm -rf tmux-2.6
rm tmux-2.6.tar.gz

# Generate TMUX Config
tmux
tmux show -g | cat > ~/.tmux.conf
exit

# Install Window Management Components
sudo apt-get install i3-gaps
sudo apt-get install i3blocks
sudo apt-get install compton
sudo apt-get install dunst

# GTK Customizer
sudo apt-get install lxappearance

# GTK Arc Theme
sudo apt-get install arc-theme

# GTK Icon Theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Install Fonts
sudo apt-get install unifont
sudo apt-get install ttf-mscorefonts-installer
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
ln -s "$DEV/src/Dotfiles/fonts/.fonts.conf" "$HOME/.fonts.conf"
mkdir .fonts
cd .fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git YosemiteSanFrancisco
cd YosemiteSanFrancisco
mv *.ttf ~/.fonts
cd ..
rm -rf YosemiteSanFrancisco

# Export DEV Path
export DEV="/mnt/d/Documents/Development"

# VIM Copy to Windows Copy Buffer
sudo ln -s "$DEV/src/Dotfiles/vim/bin/win32yank.exe" "/usr/bin/win32yank"

# Setup BASH Config
rm "$HOME/.bashrc"
ln -s "$DEV/src/Dotfiles/shell/.bashrc" "$HOME/.bashrc"
rm -rf "$HOME/.bash"
ln -s "$DEV/src/Dotfiles/shell/.bash" "$HOME"

# Setup ZSH Config
rm "$HOME/.zshrc"
ln -s "$DEV/src/Dotfiles/shell/.zshrc" "$HOME/.zshrc"
rm -rf "$HOME/.oh-my-zsh/themes"
ln -s "$DEV/src/Dotfiles/shell/.oh-my-zsh/themes" "$HOME/.oh-my-zsh/"

# Setup Git Config
rm "$HOME/.gitconifg"
ln -s "$DEV/src/Dotfiles/git/.gitconifg" "$HOME/.gitconfig"

# Setup TMUX Config
rm "$HOME/.tmux.conf"
ln -s "$DEV/src/Dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
rm -rf "$HOME/.tmux"
ln -s "$DEV/src/Dotfiles/tmux/.tmux" "$HOME"

# Setup Directory Colors
rm "$HOME/dircolors.ansi-darkorange"
ln -s "$DEV/src/Dotfiles/shell/dircolors.ansi-darkorange" "$HOME"

# Setup VIM Config
rm -rf "$HOME/.config/nvim"
ln -s "$DEV/src/Dotfiles/vim/nvim" "$HOME/.config/nvim"

# Setup Emacs Config
rm -rf "$HOME/.emacs.d"
ln -s "$DEV/src/Dotfiles/emacs/.emacs.d" "$HOME/.emacs.d"
rm -rf "$HOME/init.org"
ln -s "$DEV/src/Dotfiles/emacs/init.org" "$HOME/init.org"
rm -rf "$HOME/.emacs"
ln -s "$DEV/src/Dotfiles/emacs/.emacs" "$HOME/.emacs"

# Setup Ranger Config
sudo apt-get install ranger
rm -rf "$HOME/.config/ranger"
ln -s "$DEV/src/Dotfiles/ranger/" "$HOME/.config/ranger"

# Setup I3 Config
rm -rf "$HOME/.config/i3"
ln -s "$DEV/src/Dotfiles/i3" "$HOME/.config/i3"

# Setup Compton
rm -rf "$HOME/.config/compton"
ln -s "$DEV/src/Dotfiles/compton" "$HOME/.config/compton"

# Setup Rofi
rm -rf "$HOME/.config/rofi"
ln -s "$DEV/src/Dotfiles/rofi" "$HOME/.config/rofi"
ln -s "$DEV/src/Dotfiles/rofi/challenger.theme" "/usr/share/rofi/themes/challenger.theme"

# Setup X
rm -rf "$HOME/.xsessionrc"
ln -s "$DEV/src/Dotfiles/x/.xsessionrc" "$HOME/.xsessionrc"

# Setup GTK
rm -rf "$HOME/.gtkrc-2.0"
ln -s "$DEV/src/Dotfiles/gtk/gtk-2.0/.gtkrc-2.0" "$HOME/.gtkrc-2.0"
rm -rf "$HOME/.config/gtk-3.0/settings.ini"
ln -s "$DEV/src/Dotfiles/gtk/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# Setup Dunst
rm -rf "$HOME/.config/dunst/dunstrc"
mkdir dunst
ln -s "$DEV/src/Dotfiles/dunst/dunstrc" "$HOME/.config/dunst/dunstrc"

# Setup Infinality
sudo rm -rf "/etc/profile.d/infinality-settings.sh"
sudo ln -s "$DEV/src/Dotfiles/infinality/infinality-settings.sh" "/etc/profile.d/infinality-settings.sh"

# Install TMUX Plug-In Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install ZSH Syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Brightness
git clone https://github.com/haikarainen/light

# MP3 Tags for Emacs
cd emacs/.emacs.d/elpa/
mkdir tag
cd tag
wget https://www.emacswiki.org/emacs/download/tag.el
cd ~

# Shares
cd /mnt
mkdir shares
cd shares
mkdir Woofers
mkdir Ponton
mkdir Downloads
sudo mount.cifs //192.168.0.191/Woofers /mnt/shares/Woofers -o user=guest
sudo mount.cifs //192.168.0.191/Ponton /mnt/shares/Ponton -o user=guest
sudo mount.cifs //192.168.0.192/Downloads /mnt/shares/Downloads -o user=nick
