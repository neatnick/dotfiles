### GLOBALS ####################################################################
set -gx EDITOR nano
set -gx MAIN_DIR $HOME/Code
set -gx DICTIONARY /usr/share/dict/words

### ENVIRONMENTAL VARIABLES ####################################################
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

### PATH #######################################################################
set -gx PATH /usr/local/sbin $PATH # added for homebrew
set -gx PATH ./node_modules/.bin $PATH # added for NPM (must be last)
