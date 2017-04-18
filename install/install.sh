#!/usr/bin/env bash

# INSTALL SCRIPT
# Tom Bowlby Pearson 2016

# Include utils
source utils.sh

# Copy all output to a log
exec > >(tee -i install.log)
exec 2>&1

# Privilege check
ROOT_UID=0
if [ $UID -ne $ROOT_UID ]; then
  printError "You don't have sufficient privileges to run this script"
  exit 1
fi

# Update
apt-get update

# Constants
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT=$(dirname "$DIR")
WORK_DIR=$HOME/work
GIT_DIR=$WORK_DIR/git
SVN_DIR=$WORK_DIR/svn
INTELLIJ_DIR=$WORK_DIR/intellij
APP_DIR=/usr/share/applications

# Create directory structure
printHeader "CREATING DIRECTORIES"
createDirectory "$WORK_DIR"
createDirectory "$GIT_DIR"
createDirectory "$INTELLIJ_DIR"
createDirectory "$SVN_DIR"

# Add Repositories
printHeader "ADDING REPOSITORIES"
addRepository "webupd8team/java"
addRepository "no1wantdthisname/ppa"
addRepository "atareao/telegram"
addRepository "numix/ppa"

# Install common programs
printHeader "INSTALLING PACKAGES"
installPackage "curl"
installPackage "unzip"
installPackage "wget"
installPackage "zsh"
installPackage "vim"
installPackage "git"
installPackage "tmux"
installPackage "screen"
installPackage "guake"
installPackage "telegram"
installPackage "htop"
installPackage "numix-gtk-theme numix-icon-theme-circle"
installPackage "unity-tweak-tool"
installPackage "ack-grep"
installPackage "exuberant-ctags"
installPackage "clang-format"
installPackage "build-essential"
installPackage "cmake"
installPackage "python-dev"
installPackage "python3-dev"
installPackage "ca-certificates"
installPackage "zip"
installPackage "gparted"
installPackage "hardinfo"

# Install nvm
printHeader "INSTALLING NVM AND NODE"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 7.4.0
nvm use 7.4.0
npm install -g bower grunt gulp karma jasmine js-beautify
chown -R $USER:$USER ~/.nvm

# Install Ruby
printHeader "INSTALLING RUBY"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | sudo -u "$SUDO_USER" bash -s -- --ignore-dotfiles
source ~/.rvm/scripts/rvm
rvm install ruby-2.3.1
rvm use ruby-2.3.1
gem install bundler
chown -R $USER:$USER ~/.rvm

# Install SDKMAN
printHeader "INSTALLING SDK MAN"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install grails 2.5.4
sdk install groovy
sdk install maven
sdk install ant
sdk install gradle
chown -R $USER:$USER ~/.sdk

# Oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Config
printHeader "INSTALLING CONFIGURATION"
softLink "$PARENT"/vim/.vimrc "$HOME"
softLink "$PARENT"/vim/.vim "$HOME"
softLink "$PARENT"/terminal/.zsh "$HOME"
softLink "$PARENT"/terminal/.gitconfig "$HOME"
softLink "$PARENT"/terminal/.zshrc "$HOME"
softLink "$PARENT"/intellij/.ideavimrc "$HOME"
softLink "$PARENT"/intellij/settings.jar "$INTELLIJ_DIR"
softLink "$PARENT"/intellij/fidea.sh "$INTELLIJ_DIR"
softLink "$PARENT"/intellij/BkoolStyle.xml "$INTELLIJ_DIR"

# Finish successfully
exit

