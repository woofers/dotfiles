# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wagnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='emacs -nw'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enable Term Colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Java Home
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
export ANDROID_HOME="$DEV/lib/AndroidSDK"

# Sets Environment Paths
export HOME_DRIVE="/home/jaxson"
if [[ $(hostname -s) = Jaxson-PC ]]; then
    export HOME_DRIVE="/mnt/d/"
fi
export DRIVE="$HOME_DRIVE/Documents/JVD Docs/Documents/"
export DEV="$HOME_DRIVE/Documents/Development"
export ANDROID_HOME="$DEV/lib/AndroidSDK"
export SCHOOL="$DRIVE/School/UVIC/2018"
export CSC="$DRIVE/School/UVIC/2018/CSC 230"

# GO Path
export GOPATH=~/.go
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Allow Use of Windows Apps
if [[ $(hostname -s) = Jaxson-PC ]] || [[ $(hostname -s) = Jaxson-Thinkpad* ]]; then
    export PATH=$PATH:/mnt/c/Windows/System32
    alias javac="javac.exe"
    alias java="java.exe"
    alias emacs="emacs.exe"
    alias cmd="cmd.exe /c"
    alias ipconfig="cmd ipconfig"
    alias tasklist="cmd tasklist"
    alias taskkill="cmd taskkill /F"
fi

# Aliases
alias l="ls -la"
alias vi="nvim"
alias vim="nvim"
alias del="rm"
alias dir="l"
alias cb="cd .."
alias cl="cd -"
alias cr="cd /"
alias ch="cd ~"
alias tmux="tmux -2 -u"
alias tmuxw="tmux new-window -n"
alias close="tmux kill-server; exit"
alias gdpl="drive-google pull -depth -1 -ignore-name-clashes -ignore-conflict"
alias gdpu="drive-google push -depth -1 -ignore-name-clashes -ignore-conflict"
alias mupl="mu index --maildir=~/Mail/mbsync"
alias brew="sudo apt-get"
alias info="screenfetch"
alias mountiso="mount -t iso9660 -o loop"
alias mountntfs="mount -t ntfs"
alias unmount="umount"

# Screen Rotate
alias portrait="xrandr -o 1; xsetwacom set 'Wacom HID 482E Finger touch' Rotate ccw; updatebg"
alias portraitalt="xrandr -o 3; xsetwacom set 'Wacom HID 482E Finger touch' Rotate cw; updatebg"
alias landscape="xrandr -o 0; xsetwacom set 'Wacom HID 482E Finger touch' Rotate none; updatebg"
alias landscapealt="xrandr -o 2; xsetwacom set 'Wacom HID 482E Finger touch' Rotate half ; updatebg"

# Screenshot
alias screenshot="scrot"
alias updatebg="feh --bg-fill ~/Pictures/bg.jpg"

# Start in Tmux
if [ -z "$TMUX" ]
then
    tmux kill-server > /dev/null
    tmux start-server
    tmux new-session -d -s Workspace -n "Dev 1"
    tmuxw "Dev 2"
    tmuxw "School"
    tmuxw "Extra"
    tmux attach-session -t Workspace
fi


# Sets LS Colors
eval `dircolors ~/dircolors.ansi-darkorange`
zstyle ':completion:*:default' list-colors \
${(s.:.)LS_COLORS}

# Load NVM
export NVM_DIR="/home/jaxson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
