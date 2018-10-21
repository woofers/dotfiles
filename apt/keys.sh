
# Chrome
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C9

# Add Repositories
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo ln -s "$DEV/src/Dotfiles/apt/sources.list" "/etc/apt/sources.list"
sudo apt-get update
