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



#if (( $+BRNACH )); then 
#    echo "BRANCH: $BRANCH"
#else
#    #BRANCH='BR_NTR_15_APR'
#    echo "BRANCH not set: $BRANCH"
#fi


function setClassic()
{
    BRANCH='BR_TR_15_APR'
    generateAliases
}

function setNew()
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
}

generateAliases
