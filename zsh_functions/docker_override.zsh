export PATH=$PATH:$HOME/projects/docker/docker-images
export PATH=/usr/local/bin:$PATH

alias rdd="(cd $HOME/projects/docker/docker-wiring; docker_reset_instance.sh demodata)"
alias rd="(cd $HOME/projects/docker/docker-wiring; docker_reset_instance.sh nodata)"
