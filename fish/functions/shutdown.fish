function shutdown --description 'shutdown the computer'
  doas halt -p $argv; 
end
