if status is-interactive
  function fish_greeting
  end

  function print_fish_icon
    set -f fish_icon "   "

    set -f colors green blue cyan white brgreen brblue brcyan brwhite
    set -f style $(random choice $colors)

    set_color -o $style
    printf $fish_icon
    set_color reset
  end

  function print_clock_icon
    set -f prompt
    set -a prompt $(show-clock-icon -c yellow)
    set -a prompt $(date +%H:%M)
    set -a prompt ''

    echo $prompt
  end

  function fish_priori_prompt
    starship prompt \
      --status=$STARSHIP_CMD_STATUS \
      --pipestatus="$STARSHIP_CMD_PIPESTATUS" \
      --jobs=$STARSHIP_JOBS \
      --keymap $fish_bind_mode
  end

  function fish_posteriori_prompt
    print_fish_icon
  end

  function fish_priori_right_prompt
    if test $COLUMNS -gt 100
      print_clock_icon
    end
  end

  function fish_posteriori_right_prompt
  end

  set -l wd $(status dirname)
  source $wd/starship.fish

  function repaint_and_execute
    set -g is_repainting
    commandline -f repaint execute
  end

  function fish_user_key_bindings
    bind --preset \r repaint_and_execute
    bind --preset -M insert \r repaint_and_execute
  end

  function fish_prompt
    switch "$fish_key_bindings"
      case fish_hybrid_key_bindings fish_vi_key_bindings
        set STARSHIP_KEYMAP "$fish_bind_mode"
      case '*'
        set STARSHIP_KEYMAP insert
    end
    set -g STARSHIP_CMD_PIPESTATUS $pipestatus
    set -g STARSHIP_CMD_STATUS $status
    # Account for changes in variable name between v2.7 and v3.0
    set -g STARSHIP_DURATION "$CMD_DURATION$cmd_duration"
    set -g STARSHIP_JOBS (count (jobs -p))
    if not set -q is_repainting
      fish_priori_prompt
    else
      fish_posteriori_prompt
    end
  end

  function fish_right_prompt
    if not set -q is_repainting
      fish_priori_right_prompt
    else
      fish_posteriori_right_prompt
    end

    set -e is_repainting
  end

  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace underscore
  set fish_cursor_replace_one underscore

  set -xg LESS '-R~ --use-color -Dd+r$Du+B'

  abbr --add git1 git log --oneline
  abbr --add gitl 'git log --pretty=" - %h %ai %s" | cut -d \  -f 1-4,7- | sed s"/:\s/:\t/" | less -F'
  abbr --add ggo git checkout
  abbr --add clip xclip -selection clipboard

  bind --mode replace \cl 'clear'
end
