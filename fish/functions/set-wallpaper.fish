function set-wallpaper
  set -Ux WALLPAPER $argv[1]
  feh --no-fehbg --bg-scale $WALLPAPER
end
