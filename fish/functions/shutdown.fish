function shutdown --wraps='doas halt -p' --description 'alias shutdown=doas halt -p'
  doas halt -p $argv; 
end
