if status is-interactive
  function fish_greeting
  end

  function starship_transient_prompt_func
    set -f prompt
    set -a prompt $(starship module shell | string trim)
    set -a prompt $(starship module directory | string trim)
    set -a prompt $(starship module git_branch | string trim)
    set -a prompt $(starship module git_state | string trim)
    set -a prompt $(starship module git_status | string trim)
    set -a prompt $(starship module python | string trim)
    set -a prompt $(starship module jobs | string trim)
    set -a prompt "$(printf '\x1b[34m❯ ')"
    echo -s "$prompt"
  end

  function starship_transient_rprompt_func
    starship module time
  end

  starship init fish | source
  enable_transience

  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace underscore
  set fish_cursor_replace_one underscore

  set -xg LESS '-R~ --use-color -Dd+r$Du+B'
end
