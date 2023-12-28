function nvimrc --wraps=nvim --description "alias nvimrc nvim $XDG_CONFIG_HOME/nvim/init.vim"
  if ! set -q XDG_CONFIG_HOME
    set -f XDG_CONFIG_HOME ~/.config
  end

  set -f CONFIG_DIR $XDG_CONFIG_HOME/nvim

  if ls $CONFIG_DIR/init.lua &> /dev/null
    nvim $argv $CONFIG_DIR/init.lua $CONFIG_DIR/lua/*.lua
  else
    nvim $argv $CONFIG_DIR/init.vim $CONFIG_DIR/*.vim
  end
end
