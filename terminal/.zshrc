# Path to oh my zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme 
ZSH_THEME="robbyrussell"

# Plugins 
plugins=(vundle git)

# Env variables
OPT="/opt"
USR="/usr"

export PATH="$PATH"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Terminal tweaks
export EDITOR='vim'
bindkey -v
bindkey "^R" history-incremental-search-backward

# Load functions
FUNCTIONS_DIR="$HOME/.zsh/functions"
if [ -f $FUNCTIONS_DIR ]; then
  source $FUNCTIONS_DIR
else
  print "$FUNCTIONS_DIR not found."
fi

# Load aliases
ALIASES_DIR="$HOME/.zsh/aliases"
if [ -f $ALIASES_DIR ]; then
  source $ALIASES_DIR
else
  print "$ALIASES_DIR not found."
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/tbp/.sdkman"
[[ -s "/home/tbp/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tbp/.sdkman/bin/sdkman-init.sh"
