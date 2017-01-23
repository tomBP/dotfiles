# Path to oh my zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme 
ZSH_THEME="robbyrussell"

# Plugins 
plugins=(vundle)

# Env variables
OPT="/opt"
USR="/usr"

export JAVA_HOME="$USR/lib/jvm/java-8-oracle"
export PATH="$PATH"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Terminal tweaks
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

# Load SDKMAN
export SDKMAN_DIR="/home/tbp/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

