WORK=$HOME/wize_work
PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:/Developer/cassandra/bin/
PATH=$PATH:$HOME/local/idea/bin
PATH=$PATH:$HOME/local/pycharm-2.6.2/bin
PATH=$PATH:$HOME/bin/bigdata/
PATH=$PATH:/usr/sbin/
PATH=$PATH:~/local/sqldeveloper
PATH=~/local/jmeter/bin:$PATH

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
    alias work="cd  $WORK/$BRANCH"
}

function generateAliases()
{
    alias prop="vim $WORK/$BRANCH/properties/instance.properties"
    alias cdprop="cd  $WORK/$BRANCH/properties/" 
    alias work="cd  $WORK/$BRANCH/nextag/main"
    alias storm="cd $WORK/cache/storm-import-datastore"
    alias cache="cd $WORK/cache/"
    alias pushch='git push gerrit HEAD:refs/for/BR_CH_1109'
    alias pushps='git push gerrit HEAD:refs/for/BR_PS_1109'
    alias pushcache='git push gerrit HEAD:refs/for/master'
    alias rebaseps='git rebase origin/BR_PS_1109'
    alias rebasech='git rebase origin/BR_CH_1109'
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

