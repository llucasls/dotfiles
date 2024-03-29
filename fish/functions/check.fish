function check --wraps=ls --description 'list most recently modified files'
  dircolors -c | sed 's/setenv/set -fx/1' | source

  if test -t 1
    set -f color always
  else
    set -f color never
  end

  command ls -trAgo -ch --color=$color $argv | tail -n $(math $LINES - 2)
end
