# Path to oh my zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme 
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins 
plugins=(vundle)

# Env variables
OPT="/opt"
USR="/usr"

export GRADLE_HOME="$OPT/gradle-2.11"
export ANDROID_HOME="$HOME/android-sdk-linux"
export ANT_HOME="$OPT/ant-1.9.6"
export IVY_HOME="$OPT/ant-1.9.6"
export GRAILS_HOME="$OPT/grails-2.5.4"
export JAVA_HOME="$USR/lib/jvm/java-8-oracle"
export MAVEN_HOME="$OPT/maven-3.3.9"
export GROOVY_HOME="$OPT/groovy-2.4.6"
export GOPATH="$HOME/Work/Go"
export PATH="$PATH:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$USR/local/go/bin:$GRAILS_HOME/bin:$ANT_HOME/bin:$GROOVY_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

source $ZSH/oh-my-zsh.sh

# Set editor and command line behaviour to vim 
export EDITOR='vim'
bindkey -v
bindkey "^R" history-incremental-search-backward

# Load aliases
ALIASES_DIR="$HOME/.zsh/aliases"
if [ -f $ALIASES_DIR ]; then
  source $ALIASES_DIR
else
  print "$ALIASES_DIR not found."
fi

# Load node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  
 
nvm use 4.4.0

# Load ruby
export PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

rvm use ruby-2.3.1
