PATH=$PATH:$HOME/local/eclipse/
PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:$HOME/bin/work
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/Developer/cassandra/bin/
PATH=$PATH:$HOME/local/idea-IC-117.418/bin

export LD_LIBRARY_PATH=/usr/lib64:/usr/lib/jni/ 
export CATALINA_HOME=/Developer/tomcat

#java
export JAVA_HOME=/Developer/jdk
PATH=/Developer/jdk/bin/:$PATH

#export JAVA_HOME=/usr/lib/jvm/java-6-sun/
#PATH=/Developer/jdk/bin:$PATH
alias roottunnel="sudo ssh -L 80:localhost:8080 cali"


function setCache()
{
    alias pushDate="rsync -avP /home/sfaci/nextag_work/nextag_app/app/main/www/WEB-INF/classes/nextag/api/AdminDate.class cheat:/usr/home/usdev/samir/"
    alias pushCache="rsync -avP --include='CacheScrubber*.class' --exclude='*' /home/sfaci/nextag_work/nextag_app/app/main/www/WEB-INF/classes/nextag/db/ cheat:/usr/home/usdev/samir/"
    setDefault
    generateAliases
}

function buildDeploy()
{
    work
    ant compile
    pushDate
    pushCache
}

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

function generateAliases()
{
    alias prop="vim /home/sfaci/nextag_work/$BRANCH/properties/instance.properties"
    alias cprop="vim /home/sfaci/nextag_work/$BRANCH/properties/instance.properties" 
    alias cdprop="cd  /home/sfaci/nextag_work/$BRANCH/properties/" 
    alias work="cd  /home/sfaci/nextag_work/$BRANCH/nextag/main"
    alias classic="cd  /home/sfaci/nextag_work/BR_TR_15_APR/app/main"
    alias edit="vim -p java/com/nextag/travel/component/hotel/catalog/impl/lucene/LegacyLuceneHotelSearchAdapter.java  java/com/nextag/travel/component/hotel/catalog/impl/lucene/LegacyLuceneHotelCatalogComponent.java  java/com/nextag/travel/component/hotel/catalog/impl/lucene/LegacyLuceneHotelQueryFactory.java"
    alias cassar='cd /cacheDir/xcache/prod/apache-cassandra-1.0.7/bin; for i in $(seq 1 8); do echo cass$i; ./nodetool -h cass$i  cfstats | perl -00 -ne "/Tag/ && print"| grep "Read Latency"; done; for i in `seq 1 4`; do echo dcass$i; ./nodetool -h dcass$i  cfstats | perl -00 -ne "/Tag/ && print"| grep "Read Latency"; done; for i in $(seq 1 4); do echo sdcass$i; ./nodetool -h sdcass$i  cfstats | perl -00 -ne "/Tag/ && print"| grep "Read Latency"; done;'
}


setDefault
generateAliases
JACOBECFG=$HOME/jacob/default.cfg
PATH=$PATH:$HOME/local/jacob:/sbin:/usr/sbin/
