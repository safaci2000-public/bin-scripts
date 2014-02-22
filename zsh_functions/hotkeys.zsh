insert_sudo     () { zle beginning-of-line; zle -U "sudo "         }
insert_apt      () { zle beginning-of-line; zle -U "sudo apt-get install" }

zle -N insert-sudo      insert_sudo
zle -N insert-apt       insert_apt

bindkey "^k" insert-sudo
bindkey "^b" insert-apt
