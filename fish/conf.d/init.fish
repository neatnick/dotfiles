set -l CURRENT_DIR (dirname (status --current-filename))

# source exports
source $CURRENT_DIR/../src/exports.fish

# source aliases
source $CURRENT_DIR/../src/aliases.fish

# go to prefered starting directory
if status --is-interactive
  cd $MAIN_DIR
end
