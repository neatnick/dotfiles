# sudo (override)
# overrides sudo to allow the use of the shortcut `sudo !!`
function sudo
  if test "$argv" = !!
    eval command sudo $history[1]
  else
    command sudo $argv
  end
end
