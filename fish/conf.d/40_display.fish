if status is-login; and string match -qr '^/dev/tty1$' $(tty)
  set -gx FISH_PID $fish_pid
  startx &> /dev/null
end
