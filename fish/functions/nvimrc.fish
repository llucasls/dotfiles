function nvimrc --wraps=nvim --description "alias nvimrc nvim $XDG_CONFIG_HOME/nvim/init.vim"
  if ! set -q XDG_CONFIG_HOME
    set -f XDG_CONFIG_HOME ~/.config
  end
  if ls $XDG_CONFIG_HOME/nvim/init.lua &> /dev/null
    nvim $argv $XDG_CONFIG_HOME/nvim/init.lua
  else
    nvim $argv $XDG_CONFIG_HOME/nvim/init.vim
  end
end
