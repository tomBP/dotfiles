# Path to oh my zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme 
ZSH_THEME="robbyrussell"

# Case sensitive completion
# CASE_SENSITIVE="true"
   
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins 
plugins=(vundle)

# Env variables
export GRADLE_HOME="/opt/gradle-2.10"
export GRAILS_HOME="/opt/grails-3.1.1"
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export MAVEN_HOME="/opt/apache-maven-3.3.9"
export GOPATH="$HOME/Work/Go"
export PATH="$PATH:$MAVEN_HOME/bin:$GRADLE_HOME/bin:/usr/local/go/bin:$GRAILS_HOME/bin"

# Swap ESC with CAPS
/usr/bin/setxkbmap -option "caps:swapescape"

source $ZSH/oh-my-zsh.sh

# Set editor and command line behaviour to vim 
export EDITOR='vim'
bindkey -v

# Aliases 
alias h='cd ~'
alias g='cd ~/git'
alias hosts='sudo vim /etc/hosts'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
 
nvm use 5.0
