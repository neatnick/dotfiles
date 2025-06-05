function fish_prompt --description 'Write out the prompt'
  set laststatus $status

  function _git_branch_name
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        git branch --show-current 2>/dev/null
    end
  end

  function _git_changes
    echo (git status --porcelain)
  end

  set branch (_git_branch_name)
  if test -n "$branch"
    if test -n (_git_changes)
        set git_branch (set_color yellow)$branch
    else
        set git_branch (set_color green)$branch
    end
    set git_info "($git_branch"(set_color normal)")"
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
