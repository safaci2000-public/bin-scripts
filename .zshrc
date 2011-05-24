autoload -U compinit promptinit compinit
promptinit
setopt COMPLETE_IN_WORD

prompt zefram
autoload -U colors && colors
export RPROMPT="%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
export PS1='%n %{$fg[yellow]%}%D{%H:%M.%S} %{$reset_color%}% %! %%> '

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

##### Global Aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g BR='>& /dev/null &|'

setopt EXTENDED_GLOB
for file in ~/.zsh_local/*.zsh; do
      . $file
  done
#source ~/.zsh_local/*.zsh
#source ~/.zsh.d/*.zsh
export PATH=$PATH:$HOME/bin/private

## vim mode
autoload -Uz edit-command-line
zle -N edit-command-line 
bindkey -M vicmd 'v' edit-command-line


alias cvs='cvs -d :ext:samirf@cvs.wolfram.com:/cvs'
