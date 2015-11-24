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

export PATH="/opt/apache-maven-3.3.3/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Set editor and command line behaviour to vim 
export EDITOR='vim'
bindkey -v

# Aliases 
alias gpm='git push origin master'
alias gdh='git diff HEAD'
alias h='cd ~'
alias g='cd ~/git'
alias sbr='mvn spring-boot:run'
alias mcv='mvn clean verify'
alias j6='export JAVA_HOME="/usr/lib/jvm/java-6-oracle"'
alias j7='export JAVA_HOME="/usr/lib/jvm/java-7-oracle"'
alias j8='export JAVA_HOME="/usr/lib/jvm/java-8-oracle"'
alias ezsh='vim ~.zshrc'
alias szsh='source ~.zshrc'
alias hosts='sudo vim /etc/hosts'
alias logs='cd /var/log/fon'
alias conf='cd /etc/fon'
