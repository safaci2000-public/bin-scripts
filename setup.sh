#!/bin/bash
echo "This script will replace your zsh, vimrc files with this package's version.  "
echo "you should have this project checkedout in $HOME/bin, otherwise it'll fail/do something stupid"
echo "hit Ctrl+C to abort"
sleep 10
rm -frv $HOME/{.zshrc,.aliases,.vim,.vimrc}
cd $HOME
ln -s $HOME/bin/.zshrc
ln -s $HOME/bin/.aliases
ln -s $HOME/bin/.vim
ln -s $HOME/bin/.vimrc
