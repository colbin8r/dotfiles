# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="avit"
# ZSH_THEME="agnoster" # my favorite so far
# ZSH_THEME="spaceship-prompt/spaceship" # a custom-installed theme
# ZSH_THEME="powerlevel9k/powerlevel9k" # a custom-installed theme
ZSH_THEME="powerlevel10k/powerlevel10k" # a custom-installed theme

# powerlevel9k prompt theme settings
# https://github.com/bhilburn/powerlevel9k
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh dir_writable dir rbenv virtualenv vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time)
# POWERLEVEL9K_MODE="nerdfont-complete"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_left"
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

# spaceship prompt theme settings
# https://github.com/denysdovhan/spaceship-prompt

### disable to use the Pure prompt (see below)

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
  git-extras
  sublime
  thefuck
  zsh-z
  common-aliases
  zsh-aliases-exa
  zsh-syntax-highlighting
  zsh-better-npm-completion
  yarn
  zsh-nvm
  transfer
  kubectl
  deno
)

source $ZSH/oh-my-zsh.sh

# User configuration

# To use the sublime Oh-My-ZSH plugin, you'll need a symlink to the executable in one of these locations:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/sublime/sublime.plugin.zsh#L5
# You can create one with:
# ln -s "/mnt/c/PATH/TO/sublime_text.exe" ~/bin/sublime_text
# for example:
# ln -s "/mnt/c/Users/rrogness/Dropbox/Sublime Text/sublime_text.exe" ~/bin/sublime_text

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# export EDITOR='subl' # Sublime Text
export EDITOR='code' # VS Code

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nano ~/.zshrc"
#alias zshreload="source ~/.zshrc"
alias zshreload="exec $SHELL -l"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias dc="docker compose"
alias subl="sublime_text"
# Above alias also uses
unsetopt BG_NICE
# https://github.com/wting/autojump/issues/474
#alias python="python3.7"
#alias py="python"
#alias pip="python3.7 -m pip"
# Prefer exa for instead of ls
# https://github.com/ogham/exa
# alias l="exa -l"
# alias la="exa -la"
# alias lr="exa -RFh -t modified"
# alias lt="exa -lFh -t modified"
# alias ll="exa -l"
alias flushdns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"

######

# Change start directory
# cd ~/dev

# removes Windows paths
# https://github.com/Microsoft/WSL/issues/1493#issuecomment-346294379
# PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
# https://github.com/Microsoft/WSL/issues/1493#issuecomment-266432827
# export PATH=`echo $PATH | tr ':' '\n' | grep -v /mnt/ | tr '\n' ':'`
# https://github.com/Microsoft/WSL/issues/1493#issuecomment-395865226
PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/(c|d)\// } split(/:/));')

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Add Python pip package binaries to PATH
PATH="$PATH:/home/colbin8r/.local/bin"

# Set DEFAULT_USER for agnoster theme
# https://github.com/agnoster/agnoster-zsh-theme
export DEFAULT_USER="colbin8r"

# Auto-launch ssgh-agent
# https://help.github.com/articles/working-with-ssh-key-passphrases/#auto-launching-ssh-agent-on-git-for-windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

# Use Pure prompt
# https://github.com/sindresorhus/pure
#fpath=( "$HOME/.zfunctions" $fpath )
#autoload -U promptinit; promptinit
#prompt pure

# Add ZSH completions folder
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Point Docker client to Windows Docker installation
# DOCKER_HOST=tcp://localhost:2375
# export DOCKER_HOST=localhost:2375
# https://blogs.msdn.microsoft.com/commandline/2017/12/08/cross-post-wsl-interoperability-with-docker/
# Enabling below line will require a password prompt on every shell start, unless the sudoers file is modified appropriately
# sudo -b ~/bin/docker-relay

# To mount some volumes in docker, need to rebind /mnt/c to /c
# https://github.com/Microsoft/WSL/issues/1854#issuecomment-291845122
# sudo mkdir /c
# sudo mount --bind /mnt/c /c

# Docker compatability
# mount /mnt/c to /c if not already done
#if [ ! -d "/c" ] || [ ! "$(ls -A /c)" ]; then
#  echo "Requiring root password to $(tput setaf 6)mount --bind /mnt/c /c$(tput sgr 0)"
#  sudo mkdir -p /c
#  sudo mount --bind /mnt/c /c
#fi
#
# Change from /mnt/c/... to /c/...
#if [ "$(pwd | cut -c -7)" = "/mnt/c/" ]; then
#  cd "$(pwd | cut -c 5-)"
#fi
#
# Provide docker for bash and docker-compose
#docker() {
#  "/c/Program Files/Docker/Docker/resources/bin/docker.exe" "$@"
#}

# Shorthand for `docker exec -it [container] /bin/bash`
# into `db [container]`
function db() {
  docker exec -it $1 /bin/bash
}

# Shorthand for `docker kill [container]`
# into `dk [container]`
function dk() {
  docker kill $1
}

# Stops all running docker containers
# http://blog.baudson.de/blog/stop-and-remove-all-docker-containers-and-images
function dkall() {
  docker stop $(docker ps -aq)
}

# Shorthand for `docker ps`
function dps() {
  docker ps "$@"
}

# Shorthand for `docker inspect`
function di() {
  docker inspect "$@"
}

# Shorthand for `mkdir [folder] && cd [folder]`
function mkd() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

# Add $HOME/bin to path
export PATH=$HOME/bin:$PATH

# Python virtualenvwrapper configuration
# (the command that provides "workon")
# install with:
# pip install --user virtualenvwrapper
# https://virtualenvwrapper.readthedocs.io/en/latest/install.html#shell-startup-file
# export WORKON_HOME=$HOME/.venvs
# export PROJECT_HOME=/c/dev
# source $HOME/.local/bin/virtualenvwrapper.sh

# MacOS specific: use brew getopt
# it can be installed with:
# brew install gnu-getopt
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# MacOS specific: use coreutils "readlink"
# brew install coreutils
alias readlink=greadlink

# Use cht.sh CLI "cheat sheet" tool
function cheat() {
  curl cht.sh/$1
}

# Use an "extract" command to unzip files
# https://news.ycombinator.com/item?id=18987485
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Android SDK location on MacOS
# https://docs.expo.io/versions/latest/workflow/android-studio-emulator/
export ANDROID_SDK=/Users/colbin8r/Library/Android/sdk
export PATH=/Users/colbin8r/Library/Android/sdk/platform-tools:$PATH
# export PATH="/usr/local/sbin:$PATH"
#
# http://johnborg.es/2019/04/android-setup-react-native.html
# export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
# export ANDROID_HOME="/usr/local/share/android-sdk"

# Use Parallels provider with Vagrant - always
export VAGRANT_DEFAULT_PROVIDER=parallels

# Add Cargo to PATH
# export PATH="$HOME/.cargo/bin:$PATH"

# Add deno binaries to PATH
export PATH="$HOME/.deno/bin:$PATH"

# Add iTerm2 integration
source ~/.iterm2_shell_integration.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
