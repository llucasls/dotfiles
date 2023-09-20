if status is-interactive
  abbr --add git1 git log --oneline
  abbr --add gitl 'git log --pretty="%h %ai %s" | format-nocolor | less -F'
  abbr --add ggo git checkout
  abbr --add clip xclip -selection clipboard
  abbr --add --set-cursor=@ egui \
    begin\nemacsclient --reuse-frame @ \> /dev/null 2\>&1 \&\ndisown\nend
  abbr --add etty emacsclient --tty

  begin
    set -l r
    if type r &> /dev/null
      set r r
    else
      set r Rscript
    end

    abbr --add --set-cursor=@ mat $r -e \''cat(@, fill = TRUE)'\'
  end
end
