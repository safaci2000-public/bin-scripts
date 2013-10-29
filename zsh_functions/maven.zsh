##maven 

function listMavenCompletions { reply=(cli:execute cli:execute-phase cobertura:cobertura archetype:generate compile clean generate-sources install test test-compile deploy package cobertura:cobertura jetty:run -Dmaven.test.skip=true -DskipTests versions:use-latest-versions dependency:tree  dependency:copy-dependencies -DarchetypeCatalog=http://tapestry.formos.com/maven-snapshot-repository -Dtest= `if [ -d ./src ] ; then find ./src -type f | grep -v svn | sed 's?.*/\([^/]*\)\..*?-Dtest=\1?' ; fi`); }
compctl -K listMavenCompletions mvn
export MAVEN_HOME=/Developer/maven3
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8 -Djava.security.egd=file:///dev/urandom"
