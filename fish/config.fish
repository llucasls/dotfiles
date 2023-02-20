if status is-interactive
  function fish_greeting
  end

  function print_fish_icon
    set -f fish_icon "  "

    set -f green 32
    set -f blue 34
    set -f cyan 36
    set -f white 37
    set -f bright_green 92
    set -f bright_blue 94
    set -f bright_cyan 96
    set -f bright_white 97

    set -f colors $green $blue $cyan $white $bright_green $bright_blue $bright_cyan $bright_white
    set -f style $(random choice $colors)

    printf "$(string join '' '\x1b[1;' $style m $fish_icon '\x1b[0m')"
  end

  function starship_transient_prompt_func
    set -f prompt
    set -a prompt $(print_fish_icon | string trim)
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

  abbr --add git1 git log --pretty=oneline
  abbr --add ggo git checkout
  abbr --add clip xclip -selection clipboard
end
