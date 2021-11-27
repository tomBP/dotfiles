#!/usr/bin/env bash

# INSTALL SCRIPT
# Tom Bowlby Pearson 2016

# Include utils
source utils.sh

# Copy all output to a log
exec > >(tee -i install.log)
exec 2>&1

# Update
apt-get update

# Constants
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT=$(dirname "$DIR")
WORK_DIR=$HOME/work
GIT_DIR=$WORK_DIR/git
INTELLIJ_DIR=$WORK_DIR/intellij
APP_DIR=/usr/share/applications

# Create directory structure
printHeader "CREATING DIRECTORIES"
createDirectory "$WORK_DIR"
createDirectory "$GIT_DIR"
createDirectory "$INTELLIJ_DIR"

# Install common programs
printHeader "INSTALLING PACKAGES"
installPackage "curl"
installPackage "unzip"
installPackage "wget"
installPackage "zsh"
installPackage "vim"
installPackage "git"
installPackage "tmux"
installPackage "guake"
installPackage "htop"
installPackage "exuberant-ctags"
installPackage "clang-format"
installPackage "build-essential"
installPackage "cmake"
installPackage "zip"

# Oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Config
printHeader "INSTALLING CONFIGURATION"
softLink "$PARENT"/vim/.vimrc "$HOME"
softLink "$PARENT"/vim/.vim "$HOME"
softLink "$PARENT"/terminal/.zsh "$HOME"
softLink "$PARENT"/terminal/.zshrc "$HOME"
softLink "$PARENT"/terminal/.gitconfig "$HOME"
softLink "$PARENT"/intellij/.ideavimrc "$HOME"

# Install SDKMAN
printHeader "INSTALLING SDK MAN"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install groovy
sdk install maven
sdk install ant
sdk install gradle

# Finish successfully
exit

