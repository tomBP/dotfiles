#!/bin/bash

# INSTALL SCRIPT
# Tom Bowlby Pearson 2016

# Include utils
source utils.sh

# Privilege check
ROOT_UID=0
if [ $UID -ne $ROOT_UID ]; then
  printError "You don't have sufficient privileges to run this script"
  exit 1
fi

# Constants
GIT_DIR=$HOME/git
DOTFILES_DIR=$GIT_DIR/dotfiles
WORK_DIR=$HOME/work
INTELLIJ_DIR=$WORK_DIR/intellij
OPT_DIR=/opt
APP_DIR=/usr/share/applications

# Create directory structure
printHeader "CREATING DIRECTORIES"
createDirectory $GIT_DIR
createDirectory $WORK_DIR
createDirectory $INTELLIJ_DIR

# Add Repositories
printHeader "ADDING REPOSITORIES"
addRepository "webupd8team/java"
addRepository "no1wantdthisname/ppa"
addRepository "atareao/telegram"
addRepository "numix/ppa"

# Install common programs
printHeader "INSTALLING PACKAGES"
installPackage "curl"
installPackage "wget"
installPackage "vim"
installPackage "git"
installPackage "telegram"
installPackage "htop"
installPackage "oracle-java8-installer"
installPackage "openjdk-8-jdk"
installPackage "openjdk-8-jdk"
installPackage "numix-gtk-theme numix-icon-theme-circle"
installPackage "unity-tweak-tool"

# Install opt programs
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
done < resources/urls.txt

# Install desktop files
cat > $APP_DIR/intellij.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Icon=/opt/intellij-15/bin/idea.png
Exec="/opt/intellij-15/bin/idea.sh" %f
Comment=Develop with pleasure!
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
EOF

# Config
printHeader "INSTALLING CONFIGURATION"
if directoryExists $DOTFILES_DIR; then
  printInfo "Configuration repo already cloned"
else
  git clone https://github.com/tomBP/dotfiles.git $DOTFILES_DIR
  ln -sf $DOTFILES_DIR/Vim/.vimrc $HOME
  ln -sf $DOTFILES_DIR/Vim/.vim $HOME
  ln -sf $DOTFILES_DIR/Terminal/.gitconfig $HOME
  ln -sf $DOTFILES_DIR/Terminal/.profile $HOME
  ln -sf $DOTFILES_DIR/Terminal/.tmux.conf $HOME
  ln -sf $DOTFILES_DIR/Terminal/.zshrc $HOME
  ln -sf $DOTFILES_DIR/IntelliJ/.ideavimrc $HOME
  ln -sf $DOTFILES_DIR/IntelliJ/settings.jar $INTELLIJ_DIR/settings.jar
fi


# Finish successfully
exit
