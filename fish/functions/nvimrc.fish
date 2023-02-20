function nvimrc --wraps=nvim --description 'open neovim’s init.vim file'
  nvim $argv ~/.config/nvim/init.vim; 
end
