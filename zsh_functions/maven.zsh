##maven 
maven_plugins=(
  'jboss'
  'tomcat'                                       # Simple plugin names can be given...
  'gwt:Maven plugin for the Google Web Toolkit'  # or take the "name:description" form.
  'android:Maven Plugin for Android'
)
zstyle ':completion:*:mvn:*' plugins $maven_plugins
#zstyle ':completion:*:mvn:*' show-advanced-phases true
##make pretty
zstyle ':completion:*:*:mvn:*:matches' group 'yes'
zstyle ':completion:*:*:mvn:*:options' description 'yes'
zstyle ':completion:*:*:mvn:*:options' auto-description '%d'
zstyle ':completion:*:*:mvn:*:descriptions' format $'\e[1m -- %d --\e[22m'
zstyle ':completion:*:*:mvn:*:messages' format $'\e[1m -- %d --\e[22m'
zstyle ':completion:*:*:mvn:*:warnings' format $'\e[1m -- No matches found --\e[22m'

