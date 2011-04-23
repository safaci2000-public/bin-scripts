bindkey -v  # use vi-style command line editing
stty -ixon  # disable ^S/^Q (XON/XOFF) flow control

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# message formatting
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

# describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# use completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${HOME}/.zsh_cache

# case-insensitive completion (uppercase from lowercase & underscores from dashes)
zstyle ':completion:*' matcher-list 'm:{a-z-}={A-Z_}'

# initialize the tab completion system
autoload -Uz compinit
compinit

# enable powerful pattern-based renaming
autoload zmv


setopt autocd                # change to a diretory if typed alone
setopt no_beep               # disable beep on all errors
alias grep='grep --color=auto'  # show the matching string in color

# web cat
[[ -x $(which wget) ]] && alias wcat='wget -q -O - '

# ssh and start a screen session on the remote server
function sshs {
	if [[ -z $* ]]; then
		echo 'Usage: sshs [options] [user@]hostname'
		echo 'SSH and automatically start a GNU screen session on the remote server'
	else
		ssh -t $* screen -DRU
	fi
}

export GDK_NATIVE_WINDOWS=true  ##eclipse bug.


set -o vi
prompt zefram
autoload -U colors && colors
export RPROMPT="%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
export PS1='%n %{$fg[yellow]%}%D{%H:%M.%S} %{$reset_color%}% %! %%> '

source ~/.aliases  ## Generic aliases
source ~/.localaliases  ## Machine dependent aliases, that can override .aliases

## vim mode
autoload -Uz edit-command-line
zle -N edit-command-line 
bindkey -M vicmd 'v' edit-command-line

export TARGET=TEST
export PATH=/Developer/bin:$PATH
export PATH=$PATH:$HOME/bin/private
alias -g BR='>& /dev/null &|'

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
