export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:$HOME/dev/sfw/play
export PATH=$PATH:$HOME/dev/sfw/ant/bin/

function generateAliases()
{
    alias work='cd ~/dev/git/snp'
    alias play='cd ~/dev/git/snp/play'
    alias smysql='sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart'
    alias pushmaster='git push gerrit HEAD:refs/for/master'
    alias rebasem='git rebase -i origin/master'
    alias gitSave="git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - -a --amend"

}

function pushbranch()
{
    git push origin --force $(git branch 2>/dev/null  | grep "*" | sed -e 's/* //')
}

generateAliases
