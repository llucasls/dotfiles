function check --wraps=ls --description 'list most recently modified files'
  if test -t 1
    set -f color always
  else
    set -f color never
  end

  command ls -lAtr -hog --color=$color $argv | tail -n $(math $LINES - 2)
end
