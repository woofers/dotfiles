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
# export UPDATE_ZSH_DAYS=7

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
plugins=(git zsh-syntax-highlighting history-substring-search)

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

# SSH Key
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Enable Term Colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Development Paths
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
export ANDROID_HOME="$DEV/lib/AndroidSDK"
export LD_LIBRARY_PATH="/usr/lib64"

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

# Screenshot
alias screenshot="scrot"

# Start in Tmux
if [ -z "$TMUX" ]
then
    tmux start-server
    tmux new-session -d -s Workspace -n "APT"
    tmuxw "Git"
    tmuxw "Development"
    tmuxw "Shcool"
    tmuxw "Extra"
    tmux attach-session -t Workspace
fi


# Sets LS Colors
eval `dircolors ~/dircolors.ansi-darkorange`
zstyle ':completion:*:default' list-colors \
${(s.:.)LS_COLORS}

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
