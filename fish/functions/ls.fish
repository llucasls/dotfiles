function ls --wraps=ls --description 'list directory contents'
  dircolors -c | sed 's/setenv/set -fx/1' | source
  set -fx LC_COLLATE C

  command ls --group-directories-first --color=auto $argv
end
