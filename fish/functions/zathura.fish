function zathura --description 'a document viewer'
  if type tabbed &> /dev/null
    tabbed -cd zathura $argv --reparent > /dev/null &
    disown
  else
    command zathura $argv > /dev/null &
    disown
  end
end
