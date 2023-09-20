if status is-login; and string match -qr '^/dev/tty(2|3)$' $(tty)
  set -gx FISH_PID $fish_pid
  startx &> /dev/null
end
