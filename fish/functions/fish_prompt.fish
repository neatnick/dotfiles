function fish_prompt --description 'Write out the prompt'
  set laststatus $status
  function _git_branch_name
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end
  function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty ^/dev/null)
  end
  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      set git_branch (set_color yellow)(_git_branch_name)
    else
      set git_branch (set_color green)(_git_branch_name)
    end
    set git_info "(git:$git_branch"(set_color normal)")"
  end
  # set_color -b transparent
  printf '%s%s%s%s%s%s%s%s%s%s%s%s%s'\
  (set_color brown)                  \
  '❰'                                \
  (set_color cyan)                   \
  $USER                              \
  (set_color brown)                  \
  '❙'                                \
  (set_color green)                  \
  (echo $PWD | sed -e "s|^$HOME|~|") \
  (set_color normal)                 \
  $git_info                          \
  (set_color brown)                  \
  '❱'                                \
  (set_color brown)
  if test $laststatus -eq 0
    printf "%s✔%s≻%s "  \
    (set_color green)   \
    (set_color brown)   \
    (set_color normal)
  else
    printf "%s✘%s≻%s "  \
    (set_color red)     \
    (set_color brown)   \
    (set_color normal)
  end
end
