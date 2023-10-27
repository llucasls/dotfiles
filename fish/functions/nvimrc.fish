function nvimrc --wraps=nvim --description "alias nvimrc nvim $XDG_CONFIG_HOME/nvim/init.vim"
  if ! set -q XDG_CONFIG_HOME
    set -f XDG_CONFIG_HOME ~/.config
  end
  nvim $argv $XDG_CONFIG_HOME/nvim/init.vim
end
