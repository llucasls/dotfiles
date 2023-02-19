function ls --wraps=exa --description 'list directory contents'
  exa --icons --group-directories-first $argv;
end
