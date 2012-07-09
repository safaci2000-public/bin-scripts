PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:/Developer/cassandra/bin/
PATH=$PATH:$HOME/local/idea-IC-117.418/bin
PATH=$PATH:$HOME/local/RubyMine-4.0.3/bin

export LD_LIBRARY_PATH=/usr/lib64:/usr/lib/jni/ 
export CATALINA_HOME=/Developer/tomcat

#java
export JAVA_HOME=/Developer/jdk
PATH=/Developer/jdk/bin/:$PATH

#export JAVA_HOME=/usr/lib/jvm/java-6-sun/
#PATH=/Developer/jdk/bin:$PATH


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
}


setDefault
generateAliases
JACOBECFG=$HOME/jacob/default.cfg
PATH=$PATH:$HOME/local/jacob:/sbin:/usr/sbin/