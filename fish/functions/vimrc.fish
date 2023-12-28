function vimrc --wraps=vim --description 'alias vimrc vim ~/.vimrc'
  if ls ~/.vim/vimrc &> /dev/null
    vim $argv ~/.vim/vimrc ~/.vim/config/*.vim
  else if ls -d ~/.vim &> /dev/null
    vim $argv ~/.vimrc ~/.vim/config/*.vim
  end
end
