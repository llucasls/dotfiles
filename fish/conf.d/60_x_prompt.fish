if status is-interactive; and string match -qvr '^vt|^linux$' $TERM
  function fish_greeting
  end

  # function fish_prompt
  #   switch "$fish_key_bindings"
  #     case fish_hybrid_key_bindings fish_vi_key_bindings
  #       set STARSHIP_KEYMAP "$fish_bind_mode"
  #     case '*'
  #       set STARSHIP_KEYMAP insert
  #   end
  #   set -g STARSHIP_CMD_PIPESTATUS $pipestatus
  #   set -g STARSHIP_CMD_STATUS $status
  #   # Account for changes in variable name between v2.7 and v3.0
  #   set -g STARSHIP_DURATION "$CMD_DURATION$cmd_duration"
  #   set -g STARSHIP_JOBS (count (jobs -p))
  #   if not set -q is_repainting
  #     fish_priori_prompt
  #   else
  #     fish_posteriori_prompt
  #   end
  # end

  # function fish_right_prompt
  #   if not set -q is_repainting
  #     fish_priori_right_prompt
  #   else
  #     fish_posteriori_right_prompt
  #   end

  #   set -e is_repainting
  # end
end
