PATH=$PATH:$HOME/local/eclipse/
PATH=$PATH:/Developer/maven3/bin
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib/jni/ 
export CATALINA_HOME=/Developer/tomcat

#java
export JAVA_HOME=/Developer/jdk
PATH=/Developer/jdk/bin:$PATH
alias roottunnel="sudo ssh -L 80:localhost:8080 cali"

alias prop='vim /home/sfaci/work/BR_NTR_15_APR/properties/instance.properties' 
alias work='cd  /home/sfaci/work/BR_NTR_15_APR/app/main'
