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

function pushup() 
{
   git push gerrit HEAD:refs/for/release-2016-$1
}

function generateAliases()
{
    alias pushmaster='git push origin master:master'
    alias pushjujube='git push gerrit HEAD:refs/for/release-2015-jujube'
    alias pushgus='git push gerrit HEAD:refs/for/release-2014-gus'
    alias pushgerrit='git push gerrit HEAD:refs/for/master'
    alias rebasem='git rebase -i origin/master'
    alias gitSave="git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - -a --amend"
    alias gitHard="git fetch origin && git reset --hard origin/master"
    alias sandbox='cd ~/projects/sandbox/'
    alias workui='cd ~/projects/ui/app-legacy-akui'
    alias workhub='cd ~/projects/ui/app-legacy-akhub'
    alias work3pas='cd ~/projects/3pas'
    alias foss='cd ~/projects/foss/'
    alias services='cd ~/projects/neuak/eng-neuak-services'

}

function setJDK8() 
{

  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home
  export OLDPATH=$PATH
  export PATH=$JAVA_HOME/bin:$PATH
}

function pyEnv() 
{
    alias venv='source $HOME/projects/python/venv/bin/activate'
    alias venv3='source $HOME/projects/python/venv3/bin/activate'
    #if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

}

function pushbranch()
{
    git push origin --force $(git branch 2>/dev/null  | grep "*" | sed -e 's/* //')
}


function mydocker() 
{
    PATH=$PATH:~/projects/docker/docker-images
    alias d=docker 
    alias dc='docker-compose'
    alias dm='docker-machine'
    alias docker_resize="echo qemu-system-x86_64 -drive file=$HOME/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 -m 512 -cdrom $HOME/Desktop/gparted-live-0.26.0-2-i686.iso -boot d -device usb-mouse -usb"

}

function overridePaths() 
{
   PATH=$PATH:$HOME/PostgreSQL/pg95/bin/
   #PATH=$PATH:~/projects/docker/docker-images/postgres_bin
   PATH=$PATH:"/Applications/Sublime Text.app/Contents/SharedSupport/bin"
}

generateAliases
setJDK8
pyEnv
mydocker 
overridePaths

EDITOR=$(which vim)
M2_HOME=/usr/local/Cellar/maven31/3.1.1/libexec
LDFLAGS="-L/usr/local/opt/openssl/lib"
CPPFLAGS="-I/usr/local/opt/openssl/include"
SCALA_HOME="/usr/local/Cellar/scala/2.11.2/libexec"

PATH=$PATH:$HOME/platform-tools/git/


#source $HOME/.nix-profile/etc/profile.d/nix.sh
#queryNixPkgs(){ nix-env -qa \* -P -f $NIXPKGS_ALL | grep -i "$1"; }
 
