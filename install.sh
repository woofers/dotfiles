
# Sudo
su
apt-get install sudo
exit

# AMD Graphics
sudo apt install firmware-linux
sudo apt install llvm-3.9 clang-3.9

# Manage Packages
sudo apt-get install software-properties-common
sudo apt-get install gcc
sudo apt-get install build-essential checkinstall
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev
sudo apt-get install libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev
sudo apt-get install libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev dh-autoreconf
sudo apt-get install help2man
sudo apt-get install gnupg gnupg2

# Install Python
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python-apt

# Install Curl
sudo apt-get install curl
sudo apt-get install git

# Install Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Install Chrome
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
cd ~

# Install Steam
sudo dpkg --add-architecture i386
sudo apt update && apt upgrade
sudo apt install steam

# Install Discord
sudo apt-get install libgconf-2-4 libappindicator1
cd ~/Downloads
wget https://dl.discordapp.net/apps/linux/0.0.3/discord-0.0.3.deb
sudo apt-get install ./discord-0.0.3.deb
rm -rf discord-0.0.3.deb
cd ~

# Install Music Players
sudo apt-get install rhythmbox
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Install Emacs
cd ~/Downloads
wget http://gnu.mirror.iweb.com/emacs/emacs-25.3.tar.gz
sudo apt-get build-dep emacs24
tar -zxvf emacs-25.3.tar.gz
cd emacs-25.3
./configure
make
sudo make install
rm -rf emacs-25.3.tar.gz
rm emacs-25.3.tar.gz

# Install Emacs Plug-Ins
sudo apt-get install hunspell

# Install mbsync
sudo apt-get install libssl-dev
cd ~/Downloads
git clone https://git.code.sf.net/p/isync/isync isync
cd isync
./autogen.sh
./configure
make
sudo make install
cd ..
rm -rf isync

# Install mu
cd ~/Downloads
sudo apt-get install gnutls-bin
sudo apt-get install gmime-2.6
sudo apt-get install python-xapian
sudo apt-get install libxapian-dev
git clone git://github.com/djcb/mu.git
cd mu
autoreconf -i && ./configure && make
sudo make install
cd ..
rm -rf mu

# Install Bash Powerline
sudo pip install powerline-shell
sudo pip install soundscrape

# Install ZSH and Oh My ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Ctags
sudo apt-get install exuberant-ctags

# Install TMUX
cd ~/Downloads
sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -zxvf tmux-2.6.tar.gz
cd tmux-2.6
./configure && make
sudo make install
cd ..
rm -rf tmux-2.6
rm tmux-2.6.tar.gz

# Generate TMUX Config
tmux
tmux show -g | cat > ~/.tmux.conf
exit

# Install Math Tools
sudo apt-get install xournal
sudo apt-get install kalgebra

# Install i3 Gaps
sudo apt-get install libxcb-xrm-dev
cd ~/Downloads
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# Install Window Management Components
sudo apt-get install dmenu
sudo apt-get install i3lock
sudo apt-get install i3blocks
sudo apt-get install rofi
sudo apt-get install feh
sudo apt-get install compton
sudo apt-get install dunst
sudo apt-get install scrot

# Install File Managers
sudo apt-get install nemo
sudo apt-get install nautilus
sudo apt-get install ranger

# GTK Customizer
sudo apt-get install lxappearance

# GTK Arc Theme
sudo apt-get install arc-theme

# GTK Icon Theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Export DEV Path
export DEV="/mnt/d/Documents/Development"
export DEV="$HOME/Documents/Development"

# Install Fonts
cd ~/Downloads
sudo apt-get install unifont
sudo apt-get install ttf-mscorefonts-installer
sudo apt-get install fonts-font-awesome
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
ln -s "$DEV/src/Dotfiles/fonts/.fonts.conf" "$HOME/.fonts.conf"
cd ~
mkdir .fonts
cd .fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git YosemiteSanFrancisco
cd YosemiteSanFrancisco
mv *.ttf ~/.fonts
cd ..
rm -rf YosemiteSanFrancisco

# Install Infinality
echo "deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/infinality.list
echo "deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/infinality.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B
sudo apt-get update
sudo apt-get install fontconfig-infinality

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
rm "$HOME/.gitconfig"
ln -s "$DEV/src/Dotfiles/git/.gitconfig" "$HOME/.gitconfig"

# Setup TMUX Config
rm "$HOME/.tmux.conf"
ln -s "$DEV/src/Dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
rm -rf "$HOME/.tmux"
ln -s "$DEV/src/Dotfiles/tmux/.tmux" "$HOME"

# Setup Directory Colors
rm "$HOME/dircolors.ansi-darkorange"
ln -s "$DEV/src/Dotfiles/shell/dircolors-orange/dircolors.ansi-darkorange" "$HOME"

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

# Setup mu4e
rm "$HOME/.mbsyncrc"
ln -s "$DEV/src/Dotfiles/mu/.mbsyncrc" "$HOME/.mbsyncrc"

# Setup Ranger Config
rm -rf "$HOME/.config/ranger"
ln -s "$DEV/src/Dotfiles/ranger/" "$HOME/.config/ranger"

# Setup I3 Config
rm -rf "$HOME/.config/i3"
ln -s "$DEV/src/Dotfiles/i3" "$HOME/.config/i3"
sudo rm /usr/share/i3blocks/battery
sudo ln -s "$DEV/src/Dotfiles/i3/scripts/battery" "/usr/share/i3blocks/battery"
sudo rm /usr/share/i3blocks/volume
sudo ln -s "$DEV/src/Dotfiles/i3/scripts/volume" "/usr/share/i3blocks/volume"

# Setup Compton
rm -rf "$HOME/.config/compton"
ln -s "$DEV/src/Dotfiles/compton" "$HOME/.config/compton"

# Setup Rofi
rm -rf "$HOME/.config/rofi"
ln -s "$DEV/src/Dotfiles/rofi" "$HOME/.config/rofi"
sudo ln -s "$DEV/src/Dotfiles/rofi/challenger.theme" "/usr/share/rofi/themes/challenger.theme"

# Setup X
rm -rf "$HOME/.xsessionrc"
ln -s "$DEV/src/Dotfiles/x/.xsessionrc" "$HOME/.xsessionrc"

# Setup GTK
rm -rf "$HOME/.gtkrc-2.0"
ln -s "$DEV/src/Dotfiles/gtk/gtk-2.0/.gtkrc-2.0" "$HOME/.gtkrc-2.0"
rm -rf "$HOME/.config/gtk-3.0/settings.ini"
ln -s "$DEV/src/Dotfiles/gtk/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# Setup Dunst
rm -rf "$HOME/.config/dunst/"
cd ~/.config/
mkdir dunst
ln -s "$DEV/src/Dotfiles/dunst" "$HOME/.config/"

# Setup Infinality
sudo rm -rf "/etc/profile.d/infinality-settings.sh"
sudo ln -s "$DEV/src/Dotfiles/infinality/infinality-settings.sh" "/etc/profile.d/infinality-settings.sh"

# Install TMUX Plug-In Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install ZSH Syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Brightness
cd ~/Downloads
git clone https://github.com/haikarainen/light
cd light
sudo make && sudo make install
cd ..
rm -rf light
cd ~

# MP3 Tags for Emacs
cd ~/.emacs.d/elpa/
mkdir tag
cd tag
wget https://www.emacswiki.org/emacs/download/tag.el

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

# Dell XPS 13 9365

# Wifi
cd ~/Downloads
wget http://http.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-iwlwifi_20170823-1_all.deb
sudo dpkg -i firmware-iwlwifi_20170823-1_all.deb
rm -rf firmware-iwlwifi_20170823-1_all.deb
wget https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-8265-ucode-22.361476.0.tgz
tar -xzvf iwlwifi-8265-ucode-22.361476.0.tgz
sudo mv iwlwifi-8265-ucode-22.361476.0/iwlwifi-8265-22.ucode /lib/firmware/iwlwifi-8265-22.ucode
rm -rf iwlwifi-8265-ucode-22.361476.0
rm iwlwifi-8265-ucode-22.361476.0.tgz
cd ~

# Upgrade Kernal for Working Sleep
sudo echo 'deb http://ftp.de.debian.org/debian sid main' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install linux-image-4.13.0-1-amd64

# Load Terminal Config
dconf load /org/gnome/terminal/legacy/ < gnome-term.txt
