function bare --wraps='git --git-dir=/home/lucas/.dotfiles/ --work-tree=/home/lucas' --description 'manage dotfiles using a bare repository'
  git --git-dir=/home/lucas/.dotfiles/ --work-tree=/home/lucas $argv; 
end
