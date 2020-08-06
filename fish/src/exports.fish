### GLOBALS ####################################################################
set -gx EDITOR nano
set -gx MAIN_DIR $HOME/Code
set -gx DICTIONARY /usr/share/dict/words

### PATH #######################################################################
set -gx PATH /usr/local/sbin $PATH # added for homebrew
set -gx PATH ./node_modules/.bin $PATH # added for NPM (must be last)
