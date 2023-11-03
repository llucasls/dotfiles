if status is-interactive; and string match -qr '^vt|^linux$' $TERM
  function fish_greeting
  end
end
