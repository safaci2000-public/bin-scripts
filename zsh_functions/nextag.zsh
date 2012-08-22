PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:/Developer/cassandra/bin/
PATH=$PATH:$HOME/local/idea-IC-117.418/bin
PATH=$PATH:$HOME/bin/work/

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
    alias work="cd  $HOME/nextag_work/$BRANCH"
}

function generateAliases()
{
    alias prop="vim $HOME/nextag_work/$BRANCH/properties/instance.properties"
    alias cdprop="cd  $HOME/nextag_work/$BRANCH/properties/" 
    alias work="cd  $HOME/nextag_work/$BRANCH/nextag/main"
    alias pushch='git push gerrit HEAD:refs/for/BR_CH_1109'
    alias pushps='git push gerrit HEAD:refs/for/BR_PS_1109'
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




setDefault
generateAliases
PATH=/sbin:$PATH
OLDPATH=$PATH
setJava6

