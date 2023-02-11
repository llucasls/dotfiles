function shutdown --wraps='doas halt -p' --description 'shutdown the computer'
  doas halt -p $argv; 
end
