##single path operation, lets me add/restore a single extra path.
addPath()
{
    export OLDPATH=$PATH
    export PATH=$PATH:$PWD
}

resPath()
{
    export PATH=$OLDPATH

}

## if adding multiple $PATH, save state lets you restore from one past point in history.
saveState()
{
    export PATHSTATE=$PATH
}

resState()
{
    export PATH=$PATHSTATE

} 

cdg()
{
    cd $1/$1-git
}

# extract various types of archive files
function extract {
	if [[ -z $1 ]]; then
		echo 'Usage: extract ARCHIVE'
		echo 'Extract files from ARCHIVE to the current directory'
	elif [[ -r $1 ]]; then
		case $1 in
			*.rar)      unrar x $1     ;;
			*.tar)      tar -xvf $1    ;;
			*.tar.bz2)  tar -xjvf $1   ;;
			*.bz2)      bzip2 -d $1    ;;
			*.tar.gz)   tar -xzvf $1   ;;
			*.gz)       gunzip -d $1   ;;
			*.tgz)      tar -xzvf $1   ;;
			*.Z)        uncompress $1  ;;
			*.zip)      unzip $1       ;;

			*) echo "ERROR: '$1' is not a known archive type"  ;;
		esac
	else
		echo "ERROR: '$1' is not a valid file"
	fi
}

# find file by name in the current directory
function ff {
	if [[ -z $1 ]]; then
		echo 'Usage: ff PATTERN'
		echo 'Recursively search for a file named PATTERN in the current directory'
	else
		find . -type f -iname $1
	fi
}

function cdf
{
	if [[ -z $1 ]]; then
		echo 'Usage: cdf PATTERN'
		echo 'cd into the directory basepath of the given file'
	else
        cd $(dirname $1)
	fi
}
