set -o vi 
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -la'
alias c=clear

export PATH=~/bin:$PATH
export PATH=~/bin/git:$PATH  ##adding custom git scripts.
export PATH=$PATH:$HOME/bin/utils
export PATH=$PATH:$HOME/bin/bigdata  ##Adding path for big data scripts

alias rshl='rsync --bwlimit=500'

export PATH=/usr/local/bin:$PATH
