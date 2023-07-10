function set-wallpaper
  set -Ux WALLPAPER $argv[1]
  feh --bg-scale $WALLPAPER
end
