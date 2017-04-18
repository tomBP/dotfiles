# dotfiles

## Installation

Clone the git repo and run the install script:

```bash
git clone https://github.com/tomBP/dotfiles.git
cd dotfiles/install
sudo ./install.sh
```

Change to zsh by running the command below, then log out and in again.

```
chsh -s $(which zsh)
```

Install vim plugins and then setup YouCompleteMe:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
:q
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
```

Change to Numix theme and icons using the Unity Tweak Tool 

First, follow these instructions to improve Linux fonts in Java Swing applications:

```
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
sudo apt-get install libfreetype6
sudo apt-get install fontconfig-infinality
sudo /etc/fonts/infinality/infctl.sh setstyle linux
sudo vim /etc/profile.d/infinality-settings.sh // UBUNTU
sudo apt-get install openjdk-8-jdk
```

Then, download IntelliJ to /opt, copy the fidea.sh file to the bin directory. 

```
sudo cp $HOME/work/intellij/fidea.sh /opt/intellij-15/bin/fidea.sh
```
Once IntelliJ is started import the settings.jar and Style.xml files. 

## Swap Caps and Escape

```
sudo vim /etc/default/keyboard
XKBOPTIONS=”caps:swapescape”
```
