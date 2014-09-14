PATH=$PATH:$HOME/bin/work/
WORK=$HOME/wize_work
PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:/Developer/zookeeper-3.4.5/bin/
PATH=$PATH:$HOME/local/idea/bin
PATH=$PATH:$HOME/local/pycharm-2.6.2/bin
PATH=$PATH:$HOME/bin/bigdata/
PATH=$PATH:/usr/sbin/
PATH=$PATH:~/local/sqldeveloper
PATH=$PATH:~/local/jmeter/bin:$PATH
PATH=$PATH:$HOME/local/sublime/
PATH=$PATH:$HOME/platform-utils/storm/
PATH=$PATH:/Developer/storm/bin
PATH=$PATH:/Developer/gradle/bin/
#adding platform-utils runnable dirs to search path.
PATH=$PATH:$HOME/platform-utils/cassandra:$HOME/platform-utils/gitutils:$HOME/platform-utils/cassandra/
source $HOME/platform-utils/cassandra/bigdata_bash


function setCass1() 
{
    PATH=/Developer/apache-cassandra-1.1.12/bin/:$OLDPATH
}

function setCass2() 
{
    PATH=/Developer/apache-cassandra-2.0.6/bin/:$OLDPATH
}

function setCassOld()
{
    PATH=/Developer/apache-cassandra-1.0.7/bin/:$OLDPATH
}


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

function pushheroku() 
{
    git push heroku --force $(git branch 2>/dev/null  | grep "*" | sed -e 's/* //') 
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
    alias workch="cd  $WORK/scrubber/main"
    alias scrub="cd $WORK/apps/cache-import/"
    alias core="cd $WORK/shared/cache-import-core/"
    alias cache="cd $WORK/cache/"
    alias sp="cd $WORK/seller-program/"
    alias seller="cd $WORK/seller/"
    alias pushch='git push gerrit HEAD:refs/for/BR_CH_1109'
    alias pushps='git push gerrit HEAD:refs/for/BR_PS_1109'
    alias pushmaster='git push gerrit HEAD:refs/for/master'
    alias rebaseps='git rebase -i origin/BR_PS_1109'
    alias rebasech='git rebase -i origin/BR_CH_1109'
    alias rebasem='git rebase -i origin/master'
    alias qacass='cassandra-cli -h v-casst.nextagqa.com -p 9160'
    alias qacass3='cqlsh v-cass1.nextagqa.com 9160'
    alias prodcass='cassandra-cli -h cass29.pv.sv.nextag.com'
    alias prodcasseu='cassandra-cli -h cass37.pv.sv.nextag.com'
    alias gitSave="git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - -a --amend"
    alias py='cd ~/wize_work/definitions'
    alias pywork='cd ~/wize_work/thrift/definitions/work/ruby'
    alias config='cd ~/wize_work/shared/configuration'
    alias define='cd ~/wize_work/thrift/definitions'
    alias common='cd ~/wize_work/shared/common-utils'
    alias trigger='cd ~/wize_work/shared/aqutilities/python'
    alias seller='cd ~/wize_work/services/seller'
}

function setJava8() 
{
	export JAVA_HOME=/Developer/jdk8
	PATH=/Developer/jdk8/bin:$OLDPATH
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


function pushServiceConfig 
{
	(cd ~/wize_work/shared/configuration; java -jar target/*shaded.jar  --action UploadFolder services -zkUrls localhost:2181 )

}

function pushStormConfig 
{
	(cd ~/wize_work/shared/configuration; java -jar target/*shaded.jar  --action UploadFolder storm  -t Storm -zkUrls localhost:2181 )
}

STORM_HOME=/Developer/storm
alias cdthrift='cd ~/wize_work/definitions'

OLDPATH=$PATH
setDefault
generateAliases
PATH=/sbin:$PATH
setJava7
setCass2
