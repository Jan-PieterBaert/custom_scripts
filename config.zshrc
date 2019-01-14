if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

export LANG=en_US.UTF-8
export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
export PATH=/home/jan-pieter/.gem/ruby/2.5.0/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/jan-pieter/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  python
  web-search
  dircycle
  dirhistory
  systemd
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
#export EDITOR='nvim'

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

# aliasses

# editting zsh-stuff
#alias zshconfig="nvim ~/.zshrc"
#alias ohmyzsh="nvim ~/.oh-my-zsh"

# general aliasses
#alias freeh="free -h"
#alias freem="free -m"
#alias cls=clear
#alias dir=ls -al
#alias vi=vim
#alias vim=nvim
#alias weather="curl 'https://wttr.in'"
#alias update_time="sudo ntpdate -s ntp.ugent.be"
#alias edit_i3_config="vim ~/.config/i3/config"
#alias bob_the_builder="make -j"
#alias serve="python3 -m http.server"
#alias fuck="sudo"
#alias playOnHoek="PULSE_SERVER=10.0.0.5 "
#alias nano=nvim

#network aliasses
#alias restartNetwork="sudo systemctl restart NetworkManager"
#alias fixWifi="sudo systemctl restart wpa_supplicant@wlp2s0"
#alias fixEth="sudo systemctl restart dhcpcd.service"
#alias gpp="git pull origin; git push origin"
#alias quteCommit="git commit -sS -m \"qute updates\" "
#alias editWifiConf="sudo nvim /etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf && fixWifi"
#alias wifiStatus="wpa_cli -i wlp2s0 status"

##pacman aliasses
#alias search_package="yay -Ss"
#alias fix_package="yay -S"
#alias update_packages="yay -Syu"
#alias download_updates="yay -Syuw"

## package-list backup and down
#alias backdown_yay="yay -S --needed - < /home/jan-pieter/custum_scripts/pkglist.txt"
#alias backup_yay="yay -Qqe > /home/jan-pieter/custum_scripts/pkglist.txt"
#alias yay="time yay"

## bumblebee aliasses
#alias startbbs="sudo systemctl start bumblebeed.service"
#alias stopbbs="sudo systemctl stop bumblebeed.service"
#alias statusbbs="sudo systemctl status bumblebeed.service"


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs battery)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_MULTILINE_FIRST_PROMT_PREFIX=''

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.alias
