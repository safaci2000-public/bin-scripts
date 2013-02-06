PATH=$PATH:$HOME/bin/work/
WORK=$HOME/wize_work
PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:/Developer/cassandra/bin/
PATH=$PATH:$HOME/local/idea/bin
PATH=$PATH:$HOME/local/pycharm-2.6.2/bin
PATH=$PATH:$HOME/bin/bigdata/
PATH=$PATH:/usr/sbin/
PATH=$PATH:~/local/sqldeveloper
PATH=~/local/jmeter/bin:$PATH
#adding platform-utils runnable dirs to search path.
PATH=$PATH:$HOME/platform-utils/cassandra:$HOME/platform-utils/gitutils:$HOME/platform-utils/cassandra/
source $HOME/platform-utils/cassandra/bigdata_bash

export LD_LIBRARY_PATH=/usr/lib64:/usr/lib/jni/ 
export CATALINA_HOME=/Developer/tomcat

function setDefault()   ##git repo
{
    BRANCH='nextag_app'
    generateAliases
}

function setPS()  ## example of a different path not used.
{
    BRANCH='BR_PS_1109'
    generateAliases
}

function setCache() 
{
    BRANCH='cache' 
    alias legacy="cd  $WORK/$BRANCH"
}

function pushbranch() 
{
    git push origin --force $(git branch 2>/dev/null  | grep "*" | sed -e 's/* //') 
}

function generateAliases()
{
    alias prop="vim $WORK/$BRANCH/properties/instance.properties"
    alias cdprop="cd  $WORK/$BRANCH/properties/" 
    alias work="cd  $WORK/$BRANCH/nextag/main"
    alias storm="cd $WORK/cache-import/"
    alias cache="cd $WORK/cache/"
    alias sp="cd $WORK/seller-program/"
    alias seller="cd $WORK/seller/"
    alias pushch='git push gerrit HEAD:refs/for/BR_CH_1109'
    alias pushps='git push gerrit HEAD:refs/for/BR_PS_1109'
    alias pushmaster='git push gerrit HEAD:refs/for/master'
    alias rebaseps='git rebase -i origin/BR_PS_1109'
    alias rebasech='git rebase -i origin/BR_CH_1109'
    alias rebasem='git rebase -i origin/master'
    alias qacass='cassandra-cli -h casst1.pv.sv.nextag.com'
    alias prodcass='cassandra-cli -h cass29.pv.sv.nextag.com'
}

function setJava7()
{
	export JAVA_HOME=/Developer/jdk7
	PATH=/Developer/jdk7/bin:$OLDPATH
}

function setJava6()
{
	#java
	export JAVA_HOME=/Developer/jdk6
	PATH=/Developer/jdk6/bin:$OLDPATH
}


STORM_HOME=/Developer/storm


setDefault
generateAliases
PATH=/sbin:$PATH
OLDPATH=$PATH
setJava7

