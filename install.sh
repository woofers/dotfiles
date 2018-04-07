
# Sudo
su
usermod -a -G sudo jaxson
apt-get install sudo
exit

# Add Repositories
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo ln -s "$DEV/src/Dotfiles/apt/sources.list" "/etc/apt/sources.list"
sudo apt-get update

# Upgrade Kernel for Working Sleep
sudo apt-get update
sudo apt-get -t experimental install linux-image-4.15-0-rc8-amd64

# AMD Graphics Drives (Gallium 0.4, Open Driver) (R9 390X)
sudo apt install firmware-linux
sudo apt install llvm-3.9 clang-3.9

# Core Build Libraries
sudo apt-get install software-properties-common
sudo apt-get install build-essential checkinstall
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev
sudo apt-get install libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev
sudo apt-get install libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev dh-autoreconf
sudo apt-get install help2man
sudo apt install cmake pkg-config libao-dev libasound2-dev libavcodec-dev libavformat-dev libbluetooth-dev libenet-dev libgtk2.0-dev liblzo2-dev libminiupnpc-dev libopenal-dev libpulse-dev libreadline-dev libsfml-dev libsoil-dev libsoundtouch-dev libswscale-dev libusb-1.0-0-dev libwxbase3.0-dev libwxgtk3.0-dev libxext-dev libxrandr-dev portaudio19-dev zlib1g-dev libudev-dev libevdev-dev "libpolarssl-dev|libmbedtls-dev" libcurl4-openssl-dev libegl1-mesa-dev libpng-dev qtbase5-private-dev
sudo apt-get install gnupg gnupg2
sudo apt-get install screenfetch

# 32-Bit Libaries
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# Install GCC
sudo apt-get install gcc

# Install JDK
sudo apt-get install default-jdk

# Install Python
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python-apt

# Install Curl and Git
sudo apt-get install curl
sudo apt-get install git

# Install NFS and SMB
sudo apt-get install nfs-common
sudo apt-get install cifs-utils

# Install Bash Powerline
sudo pip install powerline-shell

# Install ZSH and Oh My ZSH
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install ZSH Syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install ZSH History Auto-Complete
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Remove Firefox
sudo apt-get purge firefox-esr

# Install Chrome
cd ~/Downloads
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub
sudo apt-get update
sudo apt-get install google-chrome-stable
cd ~

# Install Volume Control
sudo apt-get install pavucontrol

# Install Temperature Monitoring
sudo apt-get install lm-sensors hddtemp
sudo apt-get install psensor

# Install Brightness Control
cd ~/Downloads
git clone https://github.com/haikarainen/light
cd light
sudo make && sudo make install
cd ..
rm -rf light
cd ~

# Install Go
sudo apt-get install golang-go

# Install Printer Drivers
cd ~/Downloads
wget http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.1.1-1.gz
gunzip -v ~/Downloads/linux-brprinter*
sudo bash ~/Downloads/linux-brprinter*
rm linux-brprinter-installer-2.1.1-1
cd ~

# Install Math Tools
sudo apt-get install xournal
sudo apt-get install kalgebra

# Install Discord
sudo apt-get install libgconf-2-4 libappindicator1
cd ~/Downloads
wget https://dl.discordapp.net/apps/linux/0.0.4/discord-0.0.4.deb
sudo apt-get install ./discord-0.0.4.deb
rm -rf discord-0.0.4.deb
cd ~

# Install Steam
sudo apt-get install steam

# Install Music Players
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
sudo apt-get install rhythmbox
sudo apt-get install puddletag
sudo pip install soundscrape

# Install Emacs
wget -q -O - http://emacs.secretsauce.net/key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install emacs25

# Install Emacs Spell Check
sudo apt-get install hunspell
sudo apt-get install ispell

# Install LaTeX
sudo apt-get install texlive-base
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-bibtex-extra texlive-binaries texlive-font-utils

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
sudo apt-get install texinfo
git clone git://github.com/djcb/mu.git
cd mu
autoreconf -i && ./configure && make
sudo make install
cd ..
rm -rf mu
cd ~

# Install Neovim
sudo apt-get install neovim

# Install Ctags
sudo apt-get install exuberant-ctags

# Install TMUX
sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
cd ~/Downloads
wget http://ftp.ca.debian.org/debian/pool/main/t/tmux/tmux_2.6-3_amd64.deb
sudo apt-get install ./tmux_2.6-3_amd64.deb
rm -rf tmux_2.6-3_amd64.deb
cd ~
tmux
tmux show -g | cat > ~/.tmux.conf
exit

# Install Android SDK
cd ~/Downloads
wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
unzip android-studio-ide-171.4443003-linux.zip
sudo mv android-studio /usr/local
sudo ln -s "/usr/local/android-studio/bin/studio.sh" "/usr/bin/androidstudio"
rm android-studio-ide-171.4443003-linux.zip
cd ~

# Install libgdx-tool
cd ~/Downloads
sudo wget -O - https://raw.githubusercontent.com/woofers/libgdx-tools-installer/master/install.sh | sudo bash
cd ~

# Install WINE
cd ~/Downloads
sudo apt-get install apt-transport-https
wget -nc https://repos.wine-staging.com/wine/Release.key
sudo apt-key add Release.key
sudo apt-get install winehq-staging
sudo apt-get install winetricks
winetricks corefonts cjkfonts
winetricks msxml6 riched20 riched30 vcrun6
winetricks atmlib gdiplus msxml3 msxml6 vcrun2005 vcrun2005sp1 vcrun2008 ie6 fontsmooth-rgb gecko

# Install GNOME Flashback
# http://zork.net/~st/jottings/gnome-i3.html
sudo apt-get install gnome-session-flashback

# Install i3 Gaps
sudo apt-get install libxcb-xrm-dev
sudo apt-get install i3
wget https://raw.githubusercontent.com/maestrogerardo/i3-gaps-deb/master/i3-gaps-deb
./i3-gaps-deb

# Install i3 Lock
cd ~/Downloads
git clone https://github.com/PandorasFox/i3lock-color
cd i3lock-color
git tag -f "git-$(git rev-parse --short HEAD)"
autoreconf -i && ./configure && make
cd ..
rm -rf i3lock-color
git clone https://github.com/owenthewizard/i3lock-next
cd i3lock-next
rm src/config.h
cp $DEV/src/Dotfiles/i3/lock/config.h src/config.h
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
sudo apt-get install libnotify-bin
sudo apt-get install scrot

# i3 Lock
sudo apt-get install libimlib2-dev
sudo apt-get install libxcb-composite0-dev
sudo apt-get install libpam-dev

# Install File Managers
sudo apt-get install nautilus
sudo apt-get install ranger

# GTK Customizer
sudo apt-get install lxappearance

# GTK Arc Theme
sudo apt-get install arc-theme

# GTK Icon Theme
sudo tee /etc/apt/sources.list.d/papirus-ppa.list << EOF
deb http://ppa.launchpad.net/papirus/papirus/ubuntu xenial main
EOF
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E58A9D36647CAE7F
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Export DEV Path
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
cd ~
mkdir .fonts
cd .fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git YosemiteSanFrancisco
cd YosemiteSanFrancisco
mv *.ttf ~/.fonts
cd ..
rm -rf YosemiteSanFrancisco
ln -s "$DEV/src/Dotfiles/fonts/.fonts.conf" "$HOME/.fonts.conf"

# Install Infinality
echo "deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/infinality.list
echo "deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/infinality.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B
sudo apt-get update
sudo apt-get install fontconfig-infinality

# Load Terminal Config
cd $DEV/src/Dotfiles/gnome-terminal
dconf load /org/gnome/terminal/legacy/ < gnome-term.txt

# VIM Copy to Windows Copy Buffer
sudo ln -s "$DEV/src/Dotfiles/vim/bin/win32yank.exe" "/usr/bin/win32yank"

# Setup BASH Config
rm "$HOME/.bashrc"
ln -s "$DEV/src/Dotfiles/shell/.bashrc" "$HOME/.bashrc"

# Setup ZSH Config
rm "$HOME/.zshrc"
ln -s "$DEV/src/Dotfiles/shell/.zshrc" "$HOME/.zshrc"
rm -rf "$HOME/.oh-my-zsh/themes"
ln -s "$DEV/src/Dotfiles/shell/.oh-my-zsh/themes" "$HOME/.oh-my-zsh/"
rm "$HOME/.aliases"
ln -s "$DEV/src/Dotfiles/shell/.aliases" "$HOME/.aliases"

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
sudo ln -s "$DEV/src/Dotfiles/i3/scripts/i3blocks/battery" "/usr/share/i3blocks/battery"
sudo rm /usr/share/i3blocks/volume
sudo ln -s "$DEV/src/Dotfiles/i3/scripts/i3blocks/volume" "/usr/share/i3blocks/volume"

# Setup Compton
rm -rf "$HOME/.config/compton"
ln -s "$DEV/src/Dotfiles/compton" "$HOME/.config/compton"

# Setup Rofi
rm -rf "$HOME/.config/rofi"
ln -s "$DEV/src/Dotfiles/rofi" "$HOME/.config/rofi"
sudo ln -s "$DEV/src/Dotfiles/rofi/challenger.theme" "/usr/share/rofi/themes/challenger.theme"

# Scripts
sudo ln -s $DEV/src/Dotfiles/scripts/* /usr/bin/

# Hide Home Files
rm -rf "$HOME/.hidden"
ln -s "$DEV/src/Dotfiles/nemo/.hidden" "$HOME/.hidden"

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
ln -s "$DEV/src/Dotfiles/dunst" "$HOME/.config/"

# Setup Infinality
sudo rm -rf "/etc/profile.d/infinality-settings.sh"
sudo ln -s "$DEV/src/Dotfiles/infinality/infinality-settings.sh" "/etc/profile.d/infinality-settings.sh"

# Setup Steam
sudo rm -rf "$HOME/.steam/skins"
sudo ln -s "$DEV/src/Dotfiles/steam/skins" "$HOME/.steam/skins"

# Dolphin
sudo ln -s "/usr/local/bin/dolphin/bin/dolphin-emu" "/usr/bin/dolphin"

# Fix AMD Screen Tearing
sudo rm -rf "/usr/share/X11/xorg.conf.d/20-radeon.conf"
sudo ln -s "$DEV/src/Dotfiles/x/20-radeon.conf" "/usr/share/X11/xorg.conf.d/20-radeon.conf"

# Fix Intel Screen Tearing
sudo rm -rf "/usr/share/X11/xorg.conf.d/20-intel.conf"
sudo ln -s "$DEV/src/Dotfiles/x/20-intel.conf" "/usr/share/X11/xorg.conf.d/20-intel.conf"

# Install Google Drive
go get -u github.com/odeke-em/drive/drive-gen && drive-gen drive-google

# Install TMUX Plug-In Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# NPM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node
nvm use node
nvm install --lts
nvm use --lts
npm install -g yarn
npm install -g gh-pages

# MP3 Tags for Emacs
cd ~/.emacs.d
mkdir elpa
cd elpa
mkdir tag
cd tag
wget https://www.emacswiki.org/emacs/download/tag.el

# Install Emacs Theme
git clone https://github.com/challenger-deep-theme/emacs challenger-deep

# Shares
cd /mnt
sudo mkdir shares
cd shares
sudo mkdir Woofers
sudo mkdir Ponton
sudo mkdir Downloads
cd $DEV/src/Dotfiles/fstab
sudo sh -c 'cat fstab >> /etc/fstab'
ln -s "/mnt/shares/Downloads" "$HOME/Media-Downloads"
ln -s "/mnt/shares/Woofers" "$HOME/Woofers"
ln -s "/mnt/shares/Ponton" "$HOME/Ponton"

# Dell XPS 13 9365

# Wifi
cd ~/Downloads
wget http://http.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-iwlwifi_20170823-1_all.deb
sudo apt-get install ./firmware-iwlwifi_20170823-1_all.deb
rm -rf firmware-iwlwifi_20170823-1_all.deb
cd ~

# Sleep
# Upgrade Kernel To >= 4.15
# In /etc/default/grub
# Replace
# GRUB_CMDLINE_LINUX_DEFAULT="quiet"
# With
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mem_sleep_default=s2idle"
# sudo update-grub
