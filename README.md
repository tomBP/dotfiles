# dotfiles

## Installation
Clone the git repo and run the install script:

```bash
mkdir $HOME/work/git
cd $HOME/work/git
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
vim
:PluginInstall
:q
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
