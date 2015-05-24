set -o vi 
#alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -la'
alias c=clear
alias techie="ssh user@techieworld.org"
alias sl='sl -e' ## if for some god awful reason you were dumb enough to install this program on your computer, and that
                 ## action naturally made perfect sense at the time.  This allows you to break this annoying program via Ctrl+C

export PATH=~/bin:$PATH
export PATH=~/bin/git:$PATH  ##adding custom git scripts.
export PATH=$PATH:$HOME/bin/utils
export PATH=$PATH:$HOME/bin/bigdata  ##Adding path for big data scripts

##Required for silly Ubuntu behavior.
export PATH=$PATH:/var/lib/gems/1.8/gems/cheat-1.2.1/bin/

alias rshl='rsync --bwlimit=500'

##eclipse bug, not sure if its still needed.
export GDK_NATIVE_WINDOWS=true  

export EDITOR=/usr/bin/vim
export PATH=$PATH:/usr/local/bin

export PATH=$PATH:$HOME/projects/android-sdk-linux_86/tools

#alias aptd='sudo apt-get update && sudo apt-get dist-upgrade'  ##debian
alias apta='sudo pacman -Syu && sudo rm -frv /var/cache/pacman/pkg/*.{xz,gz}'  ## am I really this lazy?  ## arch
alias aptg='sudo emerge --sync && sudo emerge -udN world -av'  ##gentoo
alias aptr='sudo yum update' ## redhat

export ANT_HOME=/usr/share/ant/
