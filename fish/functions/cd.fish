# cd (override)
# override cd to cd to `$MAIN_DIR` (instead of ~) if no arguments are provided
function cd
  switch (count $argv)
    case 0
      builtin cd $MAIN_DIR
    case '*'
      builtin cd $argv
  end
end
