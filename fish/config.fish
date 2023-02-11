if status is-interactive
  source (starship init fish --print-full-init | psub -f -s .data)

  function fish_greeting
  end

  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace underscore
  set fish_cursor_replace_one underscore

end
