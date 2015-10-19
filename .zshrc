# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
 
# Theme 
ZSH_THEME="robbyrussell"

# Case sensitive completion
# CASE_SENSITIVE="true"
 
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins 
plugins=(git tmux vundle mvn)

export PATH="$PATH"

source $ZSH/oh-my-zsh.sh

# Set editor and command line behaviour to vim 
export EDITOR='vim'
bindkey -v

export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

# Aliases 
alias gpm='git push origin master'
alias gdh='git diff HEAD'
alias h='cd ~'
alias g='cd ~/git'
alias sbr='mvn spring-boot:run'
alias mcv='mvn clean verify'

