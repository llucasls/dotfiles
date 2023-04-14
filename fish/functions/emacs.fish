function emacs --wraps=emacsclient --description 'open file in a running emacsclient'
  if ps axo comm | grep ^emacsclient > /dev/null
    emacsclient $argv &
    disown $last_pid
  else
    emacsclient --create-frame --alternate-editor="" $argv &
    disown $last_pid
  end
end
