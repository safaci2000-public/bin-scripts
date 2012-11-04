#!/bin/zsh
#############################################################################
# Automated installation script
#  - This script will set up common directories, dot files and other system
#    settings
#############################################################################
PROJECT_DIR="$HOME/bin"   #set this to a different value if project is checked out in a different location then $HOME/bin

function sanityCheck()
{
    which cabextract >& /dev/null
    
    if [ "$?" -ne 0 ] ; then
        echo "missing cabextract, please install it via apt-get install cabextract or yum install cabextract"
        exit 1;
    fi    
    
    which curl >& /dev/null
    
    if [ "$?" -ne 0 ] ; then
        echo "missing curl, please install it via apt-get install curl or yum install curl"
        exit 1;
    fi    
}

function fetchVistaFonts()
{
    (cd $HOME; $PROJECT_DIR/vistafonts-installer )
    
}

function doGit() 
{
    echo "installing gitconfig"
    sed -e "s/NAME/$NAME/" -e "s/EMAIL/$EMAIL/" $PROJECT_DIR/git/gitconfig > $HOME/.gitconfig

}

function install_fonts()
{
    
    mkdir $HOME/.fonts
    fetchVistaFonts
    echo "Installing liberation fonts..."
    mkdir -pv $HOME/.fonts/liberation
    cp fonts/liberation/*.ttf $HOME/.fonts/liberation
    echo "Installing ubuntu fonts..."
    mkdir -pv $HOME/.fonts/ubuntu
    cp fonts/ubuntu/*.ttf $HOME/.fonts/ubuntu
    echo "update font cache"
    fc-cache
    
    
}

function clean()
{
	rm -friv $HOME/{.zshrc,.aliases,.vim,.vimrc}
	cd $HOME
	ln -s $PROJECT_DIR/.zshrc
	ln -s $PROJECT_DIR/.vim
	ln -s $PROJECT_DIR/.vimrc
	ln -s $PROJECT_DIR/.zsh_local
	ln -s $PROJECT_DIR/zsh_functions/generic_functions.zsh  $PROJECT_DIR/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/aliases.zsh $PROJECT_DIR/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/history.zsh $PROJECT_DIR/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/hotkeys.zsh $PROJECT_DIR/.zsh_local/
	ln -s $PROJECT_DIR/zsh_functions/maven.zsh $PROJECT_DIR/.zsh_local/
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

function message()
{
    
     echo "Standard coding projects go in $HOME/projects"
     echo "eclipse code goes in $HOME/workspace"
     echo "any $HOME install goes into $HOME/local and binary is symlinked in $PROJECT_DIR/private"
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


echo -n  'Do you wish to install project fonts to $HOME? (y|n) '
read REPLY

if [[ $REPLY =~ ^[Yy]$ ]]
then
    install_fonts
    message
    rm -v $HOME/PowerPointViewer.exe
fi

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
