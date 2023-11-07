if status is-login
  if type nvim &> /dev/null
    set -gx EDITOR nvim
  else if type vim &> /dev/null
    set-gx EDITOR vim
  end

  set -gx LESS '-R~'
end
