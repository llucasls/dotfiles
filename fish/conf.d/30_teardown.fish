if status is-login
  function _teardown --on-event fish_exit --description "Execute logout script if found"
    set -f logout_script "$XDG_DATA_HOME/fish/logout.fish"

    if test -r "$logout_script"
      source "$logout_script"
    end
  end

  function _x_teardown --on-signal HUP --description "Execute logout script if found"
    set -f logout_script "$XDG_DATA_HOME/fish/logout.fish"

    functions --erase _teardown _x_teardown

    if test -r "$logout_script"
      source "$logout_script"
    end

    kill -1 $fish_pid
  end
end
