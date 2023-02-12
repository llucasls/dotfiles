function ls --wraps='command ls --group-directories-first --color=auto' --description 'alias ls command ls --group-directories-first --color=auto'
  command ls --group-directories-first --color=auto $argv
end
