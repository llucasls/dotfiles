# https://docs.kernel.org/admin-guide/ufs.html
function mount_bsd --wraps=mount --description 'mount a UFS/FFS partition'
  if type doas &> /dev/null
    set -f priv doas
  else if type sudo &> /dev/null
    set -f priv sudo
  else
    printf 'Error: no privilege elevation program found\n' >&2
    return 1
  end

  $priv mount -t ufs -o ufstype=44bsd $argv
end
