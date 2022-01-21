### GLOBALS ####################################################################
set -gx EDITOR nano
set -gx MAIN_DIR $HOME/Code
set -gx DICTIONARY /usr/share/dict/words

### PATH #######################################################################
set -gx PATH $PATH /Users/nick/Library/Python/3.9/bin # added python bin to the end for locally installed pip binaries
set -gx PATH /usr/local/sbin $PATH # added for homebrew
set -gx PATH ./node_modules/.bin $PATH # added for NPM (should be first)
