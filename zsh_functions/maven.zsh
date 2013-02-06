##maven 

function listMavenCompletions { reply=(cli:execute cli:execute-phase cobertura:cobertura archetype:generate compile clean generate-sources install test test-compile deploy package cobertura:cobertura jetty:run -Dmaven.test.skip=true -DskipTests versions:use-latest-versions   -DarchetypeCatalog=http://tapestry.formos.com/maven-snapshot-repository -Dtest= `if [ -d ./src ] ; then find ./src -type f | grep -v svn | sed 's?.*/\([^/]*\)\..*?-Dtest=\1?' ; fi`); }
compctl -K listMavenCompletions mvn
