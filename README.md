# dotfiles

```bash
mkdir $HOME/work/git
cd $HOME/work/git
git clone https://github.com/tomBP/dotfiles.git
cd dotfiles/install
sudo ./install.sh
chsh -s $(which zsh)
vim
:PluginInstall
:q
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
```
