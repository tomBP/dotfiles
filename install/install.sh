#!/usr/bin/env bash

# INSTALL SCRIPT
# Tom Bowlby Pearson 2016

# Include utils
source utils.sh

# Copy all output to a log
exec > >(tee -i install-log.txt)
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
PARENT=$(dirname $DIR)
WORK_DIR=$HOME/work
GIT_DIR=$WORK_DIR/git
SVN_DIR=$WORK_DIR/svn
INTELLIJ_DIR=$WORK_DIR/intellij
OPT_DIR=/opt
APP_DIR=/usr/share/applications

# Create directory structure
printHeader "CREATING DIRECTORIES"
createDirectory $WORK_DIR
createDirectory $GIT_DIR
createDirectory $SVN_DIR
createDirectory $INTELLIJ_DIR

# Add Repositories
printHeader "ADDING REPOSITORIES"
addRepository "webupd8team/java"
addRepository "no1wantdthisname/ppa"
addRepository "atareao/telegram"
addRepository "numix/ppa"

# Install common programs
printHeader "INSTALLING PACKAGES"
installPackage "mutt"
installPackage "curl"
installPackage "unzip"
installPackage "wget"
installPackage "zsh"
installPackage "vim"
installPackage "git"
installPackage "tmux"
installPackage "guake"
installPackage "telegram"
installPackage "htop"
installPackage "oracle-java8-installer"
installPackage "openjdk-8-jdk"
installPackage "numix-gtk-theme numix-icon-theme-circle"
installPackage "unity-tweak-tool"
installPackage "ack-grep"
installPackage "exuberant-ctags"

# Install opt programs
printHeader "INSTALLING SOFTWARE TO OPT"
while IFS=" " read name version url; do
    if directoryExists $OPT_DIR/$name-$version; then
       printInfo "$name $version already installed"
    else
       printInfo "Downloading $name $version..."
       if downloadAndUnzip $url $OPT_DIR; then
           printInfo "Successfully downloaded $name $version"
       else
           printError "Failed to download $name $version"
       fi
    fi
done < urls.txt

# Install desktop files
printHeader "INSTALLING DESKTOP FILES"
cat > $APP_DIR/intellij.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Icon=/opt/intellij-15/bin/idea.png
Exec="/opt/intellij-15/bin/fidea.sh" %f
Comment=Develop with pleasure!
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
EOF

if [ "$?" -eq "0" ]; then
    printInfo "Intellij desktop entry added"
else
    printError "Failed to add Intellij desktop entry"
fi

# Install nvm
printHeader "INSTALLING NVM AND NODE"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 4.4.0
nvm use 4.4.0
npm install -g bower grunt gulp karma jasmine

# Install Ruby
printHeader "INSTALLING RUBY"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | sudo -u $SUDO_USER bash -s -- --ignore-dotfiles
source ~/.rvm/scripts/rvm
rvm install ruby-2.3.1
rvm use ruby-2.3.1
gem install bundler

# Oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Config
printHeader "INSTALLING CONFIGURATION"
softLink $PARENT/vim/.vimrc $HOME
softLink $PARENT/vim/.vim $HOME
softLink $PARENT/terminal/.zsh $HOME
softLink $PARENT/terminal/.gitconfig $HOME
softLink $PARENT/terminal/.profile $HOME
softLink $PARENT/terminal/.tmux.conf $HOME
softLink $PARENT/terminal/.zshrc $HOME
softLink $PARENT/intellij/.ideavimrc $HOME
softLink $PARENT/intellij/settings.jar $INTELLIJ_DIR
softLink $PARENT/intellij/fidea.sh $INTELLIJ_DIR
softLink $PARENT/intellij/GoogleStyle.xml $INTELLIJ_DIR

# Personal wiki
git clone https://github.com/tomBP/tomBP.github.io $GIT_DIR/wiki
(cd $GIT_DIR/wiki; chown $USER *; sudo -u $SUDO_USER bundle install)

# Finish successfully
exit
