function _sv_enable
  set -f SVDIR $XDG_RUNTIME_DIR/service
  set service $argv[1]

  if test ! -d $SVDIR
    mkdir -p $SVDIR
  end

  ln -sft $SVDIR $HOME/.repos/runit-service/sv/$service
end

function _sv_disable
  set -f SVDIR $XDG_RUNTIME_DIR/service
  set service $argv[1]

  if test -L $SVDIR/$service
    unlink $SVDIR/$service
  end
end

function _sv
  set -fx SVDIR $XDG_RUNTIME_DIR/service
  command sv $argv
end

function _sv_list
  set -f SVDIR $XDG_RUNTIME_DIR/service

  if test ! -d $SVDIR
    mkdir -p $SVDIR
  end

  for service in (ls $SVDIR)
    sv status $service
  end
end

function sv --description 'control and manage services monitored by runsv(8)'
  argparse v w= -- $argv

  if set -q _flag_w
    set -f v '-v'

    set -f w '-w'
    set -a w $_flag_w
  end

  if set -q _flag_v
    set -f v '-v'
  end

  set -f command $argv[1]
  set -f services $argv[2..]

  if test $command = enable
    for service in $services
      _sv_enable $service
    end
  else if test $command = disable
    for service in $services
      _sv_disable $service
    end
  else if test $command = list
    _sv_list
  else
    _sv $v $w $argv
  end
end
