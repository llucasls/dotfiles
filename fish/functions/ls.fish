function ls --wraps=exa --description 'alias ls exa'
  exa --group-directories-first $argv; 
end
