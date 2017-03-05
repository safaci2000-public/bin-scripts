#!/bin/zsh
#############################################################################
# Automated installation script
#  - This script will set up common directories, dot files and other system
#    settings
#############################################################################
PROJECT_DIR="$HOME/bin"   #set this to a different value if project is checked out in a different location then $HOME/bin

function sanityCheck()
{
    
    which curl >& /dev/null
    
    if [ "$?" -ne 0 ] ; then
    	echo "missing curl, please install it via apt-get install curl or yum install curl"
    	exit 1;
    fi	
}

function doGit() 
{
    echo "installing gitconfig"
    sed -e "s/NAME/$NAME/" -e "s/EMAIL/$EMAIL/" $PROJECT_DIR/git/gitconfig > $HOME/.gitconfig

}

function clean()
{
	rm -friv $HOME/{.zshrc,.zsh_local,.vim,.vimrc}
	cd $HOME
	ln -s $PROJECT_DIR/zshrc.zplug $HOME/.zshrc
	ln -s $PROJECT_DIR/.vim
	ln -s $PROJECT_DIR/.vimrc
	ln -s $PROJECT_DIR/.zsh_local
	ln -s $PROJECT_DIR/zplug $HOME/.zplug
	ln -s $PROJECT_DIR/zsh_functions/aliases.zsh $HOME/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/history.zsh $HOME/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/docker_override.zsh  $HOME/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/hotkeys.zsh $HOME/.zsh_local/
    ln -s $PROJECT_DIR/zsh_functions/neustar.zsh $PROJECT_DIR/.zsh_local/
}		

function init()
{
	clean
	echo "Creating standard dirs"
	for i in projects seeds torrent local workspace iso iso/linux iso/msft iso/mac; do 
    	if [ ! -e ${i} ]; then
           mkdir $HOME/$i >& /dev/null
		fi 
	done
	
}

function fetchGitHubUtils()
{
	curl -s http://github.com/github/upload/raw/master/upload.rb > $PROJECT_DIR/git/github_upload
	chmod a+x $PROJECT_DIR/git/github_upload
}

function message()
{
	
     echo "Standard coding projects go in $HOME/projects"
     echo "eclipse code goes in $HOME/workspace"
     echo "any $HOME install goes into $HOME/local and binary is symlinked in $HOME/bin/private"
     echo "seeds/torrents are self explantory if used"
     echo "most of my system end up with one or two isos.. which go in the iso folder, optionally sorted by OS"
	
}


echo "This script will automatically update your system to use common directories, "
echo "various dotfiles (zsh, vimrc, etc) and other assorted goodies. "
echo " "

# Ask the user to confirm before proceeding
echo -n  "Do you wish to continue? (y|n) "
read REPLY
if [[  $REPLY =~ ^[Nn]$ ]]
then
    exit 1
fi

sanityCheck
init


echo -n  'Do you wish to install git customizations into $HOME? (y|n) '
read REPLY

if [[ $REPLY =~ ^[Yy]$ ]]
then
    ans="n"
    while [[ $ans =~ ^[Nn]$ ]] 
    do    
        echo -n "Please enter your your full name:  "
        read NAME
        echo -n "Please enter your email address: " 
        read EMAIL
        echo -n "This information read is: $NAME < $EMAIL >, is this correct? (y|n)? " 
        read ans
    done
    doGit
fi
