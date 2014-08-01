##maven 

function listMavenCompletions { reply=(cli:execute cli:execute-phase cobertura:cobertura archetype:generate compile clean generate-sources install test test-compile deploy package cobertura:cobertura jetty:run tomcat7:run source:jar  -Dmaven.test.skip=true -DskipTests versions:use-latest-versions dependency:tree  dependency:copy-dependencies  dependency:sources -Dclassifier=javadoc -DarchetypeCatalog=http://tapestry.formos.com/maven-snapshot-repository -Dtest= `if [ -d ./src ] ; then find ./src -type f | grep -v svn | sed 's?.*/\([^/]*\)\..*?-Dtest=\1?' ; fi`); }
compctl -K listMavenCompletions mvn
export MAVEN_HOME=/Developer/maven3
#export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8 -Djava.security.egd=file:///dev/urandom  -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=$RANDOM"
#export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
#export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8"
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8"

function configure_repo() {
    # pick up first groupId...assuming that the POM's group is at the top or is picked up
    # from a parent declaration at the top.
    GROUP=`grep -m 1 groupId pom.xml | sed -e 's/.*<groupId>\(.*\)<\/groupId>.*/\1/'`
    case $GROUP in 
        "net.agkn")
            mvnPerforce
            ;;
        "biz.neustar.ms")
            mvnLocalNexus
            ;;
        *)
            echo "Don't know which repo to use for $GROUP..."
            exit -1
            ;;
    esac
}

function mvnLocalNexus() {
(
  cd $HOME/.m2;
  git checkout localNexus
)
}



function mvnNexus() {
(
  cd $HOME/.m2;
  git checkout nexus
)
}

function mvnPerforce() {
(
  cd $HOME/.m2;
  git checkout master 
)
}

function mvnStatus() {
(
  cd $HOME/.m2;
  git branch 
)
}

alias mvn='configure_repo && mvn'
