#!/bin/bash
echo "This script will replace your zsh, vimrc files with this package's version.  "
echo "you should have this project checkedout in $HOME/bin, otherwise it'll fail/do something stupid"
echo "hit Ctrl+C to abort"
sleep 10
rm -frv $HOME/{.zshrc,.aliases,.vim,.vimrc}
cd $HOME
ln -s $HOME/bin/.zshrc
ln -s $HOME/bin/.vim
ln -s $HOME/bin/.vimrc
ln -s $HOME/bin/.zsh_local
ln -s $HOME/bin/zsh_functions/generic_functions.zsh  $HOME/bin/.zsh_local/
ln -s $HOME/bin/zsh_functions/aliases.zsh $HOME/bin/.zsh_local/
echo "Creating standard dirs"
mkdir $HOME/projects >& /dev/null
mkdir $HOME/{seeds,torrent,local,workspace,iso}  >& /dev/null
mkdir $HOME/iso/{linux,msft,mac}

echo "Standard coding projects go in $HOME/projects"
echo "eclipse code goes in $HOME/workspace"
echo "any $HOME install goes into $HOME/local and binary is symlinked in $HOME/bin/private"
echo "seeds/torrents are self explantory if used"
echo "most of my system end up with one or two isos.. which go in the iso folder, optionally sorted by OS"
