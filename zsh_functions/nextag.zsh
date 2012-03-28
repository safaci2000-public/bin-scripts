PATH=$PATH:$HOME/local/eclipse/
PATH=$PATH:/Developer/maven3/bin
PATH=$PATH:$HOME/bin/work
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export LD_LIBRARY_PATH=/usr/lib64:/usr/lib/jni/ 
export CATALINA_HOME=/Developer/tomcat

#java
export JAVA_HOME=/Developer/jdk
export JAVA_HOME=/usr/lib/jvm/java-6-sun/
#PATH=/Developer/jdk/bin:$PATH
alias roottunnel="sudo ssh -L 80:localhost:8080 cali"



function setCache()   ## XCache Branch
{
    BRANCH='BR_CH_1109'
    generateAliases
}

function setDefault()   ##git repo
{
    BRANCH='nextag_app'
    generateAliases
}

function setIM()  ## backend branch
{
    BRANCH='BR_TR_14_IM_AUG'
    generateAliases
}


function setClassic()  #Classic Travel
{
    BRANCH='BR_TR_15_APR'
    generateAliases
}

function setNew()  ## Nextravel branch
{
    BRANCH='BR_NTR_15_APR'
    generateAliases
}

function generateAliases()
{
    alias prop="vim /home/sfaci/work/$BRANCH/properties/instance.properties"
    alias cprop="vim /home/sfaci/work/$BRANCH/properties/instance.properties" 
    alias cdprop="cd  /home/sfaci/work/$BRANCH/properties/" 
    alias work="cd  /home/sfaci/work/$BRANCH/app/main"
    alias classic="cd  /home/sfaci/work/BR_TR_15_APR/app/main"
    alias edit="vim -p java/com/nextag/travel/component/hotel/catalog/impl/lucene/LegacyLuceneHotelSearchAdapter.java  java/com/nextag/travel/component/hotel/catalog/impl/lucene/LegacyLuceneHotelCatalogComponent.java  java/com/nextag/travel/component/hotel/catalog/impl/lucene/LegacyLuceneHotelQueryFactory.java"
    alias cassar='cd /cacheDir/xcache/prod/apache-cassandra-1.0.7/bin; for i in $(seq 1 8); do echo cass$i; ./nodetool -h cass$i  cfstats | perl -00 -ne "/Tag/ && print"| grep "Read Latency"; done; for i in `seq 1 4`; do echo dcass$i; ./nodetool -h dcass$i  cfstats | perl -00 -ne "/Tag/ && print"| grep "Read Latency"; done; for i in $(seq 1 4); do echo sdcass$i; ./nodetool -h sdcass$i  cfstats | perl -00 -ne "/Tag/ && print"| grep "Read Latency"; done;'
}

setDefault
generateAliases
