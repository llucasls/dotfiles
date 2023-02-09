function reboot --description 'alias reboot=doas reboot'
  doas reboot $argv; 
end
