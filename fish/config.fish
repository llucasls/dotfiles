if status is-interactive
  function print_fish_icon
    set -f fish_icon " 󰈺  "

    set -f colors green blue cyan white brgreen brblue brcyan brwhite
    set -f style $(random choice $colors)

    set_color -o $style
    if test $TERM = linux
      printf '> '
    else
      printf $fish_icon
    end
    set_color reset
  end

  function print_clock_icon
    set -f prompt
    if test $TERM != linux
      set -a prompt $(show-clock-icon -c yellow)
    end
    set -a prompt $(date +%H:%M)
    set -a prompt ''

    echo $prompt
  end

  function print_prompt_char
    set -f ok $argv[1]

    switch $fish_bind_mode
      case default
        set_color blue
      case insert
        if test $ok -eq 0
          set_color green
        else
          set_color red
      end
      case replace_one
        set_color cyan
      case replace
        set_color cyan
      case visual
        set_color yellow
      case '*'
        set_color magenta
    end

    printf '>'
    set_color normal
  end

  function fish_priori_prompt
    if test $TERM = linux
      printf '%s %s ' $(prompt_pwd) $(print_prompt_char $STARSHIP_CMD_STATUS)
    else
      starship prompt \
        --status=$STARSHIP_CMD_STATUS \
        --pipestatus=$STARSHIP_CMD_PIPESTATUS \
        --jobs=$STARSHIP_JOBS \
        --keymap $fish_bind_mode
    end
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

  bind --mode replace \cl 'clear'
end
