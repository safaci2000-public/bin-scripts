# To install source this file from your .zshrc file
source $HOME/bin/zsh_antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#
## For SSH, starting ssh-agent is annoying
#antigen bundle ssh-agent
# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle aws
antigen bundle bower 
#antigen bundle github
#antigen bundle heroku
#antigen bundle nmn/gulp.plugin.zsh
#antigen bundle python 
#antigen bundle scala 
#antigen bundle sublime 
#antigen bundle tmuxinator
antigen bundle command-not-found
antigen bundle docker
#antigen bundle docker-compose 
antigen bundle sdurrheimer/docker-compose-zsh-completion
antigen bundle git
antigen bundle git-extras
#antigen bundle gradle 
antigen bundle mvn 
antigen bundle pip
antigen bundle z 

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
#
# # Load the theme.
antigen theme muse


#NOTE: OS detection not working atm.  Look into this.
# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
        antigen bundle systemd
    fi
    if [[ $DISTRO == 'Fedora' ]]; then
        antigen bundle fedora
        antigen bundle systemd
    fi
fi

bindkey -v  # use vi-style command line editing
stty -ixon  # disable ^S/^Q (XON/XOFF) flow control

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${HOME}/.zsh_cache

# enable powerful pattern-based renaming
autoload zmv

setopt autocd                # change to a diretory if typed alone
setopt no_beep               # disable beep on all errors
alias grep='grep --color=auto'  # show the matching string in color

##### Global Aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g BR='>& /dev/null &|'

setopt EXTENDED_GLOB
for file in ~/.zsh_local/*.zsh; do
	if [[ -e $file ]]; then
      		. $file
	fi
done

function processPort() 
{

    sudo lsof -n -i:$1 | grep LISTEN
}

export PATH=$PATH:$HOME/bin/private

## vim mode
autoload -Uz edit-command-line
zle -N edit-command-line 
bindkey -M vicmd 'v' edit-command-line

alias openports='netstat --all --numeric --programs --inet --inet6'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -s "/Users/sfaci/.nvm/nvm.sh" ] && . "/Users/sfaci/.nvm/nvm.sh" # This loads nvm

fpath=(~/.zsh/completion $fpath)
#autoload -Uz compinit && compinit -i

#
# # Tell antigen that you're done.
antigen apply

compinit
skip_global_compinit=1
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/sfaci/.travis/travis.sh ] && source /Users/sfaci/.travis/travis.sh


. /Users/sfaci/torch/install/bin/torch-activate

# The next line updates PATH for the Google Cloud SDK.
source '/Users/sfaci/projects/foss/hackaton/t/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/sfaci/projects/foss/hackaton/t/google-cloud-sdk/completion.zsh.inc'
