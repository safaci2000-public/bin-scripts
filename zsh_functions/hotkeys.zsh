insert_sudo     () { zle beginning-of-line; zle -U "sudo "         }
insert_yum      () { zle beginning-of-line; zle -U "sudo yum install" }
insert_apt      () { zle beginning-of-line; zle -U "sudo apt-get install" }

zle -N insert-sudo      insert_sudo
zle -N insert-yum       insert_yum 

bindkey "^k" insert-sudo
bindkey "^b" insert-yum 
