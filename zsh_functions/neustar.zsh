function showFiles() 
{
    defaults write com.apple.finder AppleShowAllFiles YES
    killall Finder /System/Library/CoreServices/Finder.app
}

function hideFiles()
{
    defaults write com.apple.finder AppleShowAllFiles NO
    killall Finder /System/Library/CoreServices/Finder.app
}

function generateAliases()
{
    alias pushmaster='git push origin master:master'
    alias pushgerrit='git push gerrit HEAD:refs/for/master'
    alias rebasem='git rebase -i origin/master'
    alias gitSave="git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - -a --amend"
    alias sandbox='cd ~/projects/sandbox/'
    alias workui='cd ~/projects/akui'
    alias workhub='cd ~/projects/akhub'
    alias work3pas='cd ~/projects/3pas'
    alias foss='cd ~/projects/foss/'

}

function setJDK7()
{
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home
  export OLDPATH=$PATH
  export PATH=$JAVA_HOME/bin/:$PATH

}

function setJDK8() 
{

  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
  export OLDPATH=$PATH
  export PATH=$JAVA_HOME/bin/:$PATH
}

function pyEnv() 
{
    alias venv='source $HOME/venv/bin/activate'
    #if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

}

function vcs() 
{
P4PORT=source.corp.agkn.net:1666
P4USER=sfaci
#P4CLIENT=sfaci_sfaci-mac_4426
P4CLIENT=sfaci_perforce
#P4PASSWD=****
export P4PORT P4USER P4CLIENT 
}

function pushbranch()
{
    git push origin --force $(git branch 2>/dev/null  | grep "*" | sed -e 's/* //')
}

generateAliases
setJDK7
vcs
pyEnv

LDFLAGS="-L/usr/local/opt/openssl/lib"
CPPFLAGS="-I/usr/local/opt/openssl/include"
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
M2_HOME=/usr/local/Cellar/maven31/3.1.1/libexec
SCALA_HOME="/usr/local/Cellar/scala/2.11.2/libexec"
LEGACY="~/legacy/perforce/branches/release/2014/gus/ui/apps/akhub"

PATH=$PATH:$HOME/platform-tools/git/

export DOCKER_HOST=tcp://$(boot2docker ip):2376 export DOCKER_CERT_PATH=/Users/sfaci/.boot2docker/certs/boot2docker-vm export DOCKER_TLS_VERIFY=1

alias dockershell="docker exec -it mipdb_db_1 /bin/bash"
