# https://www.kernel.org/doc/Documentation/power/states.txt
# https://www.kernel.org/doc/Documentation/power/interface.txt
# https://www.kernel.org/doc/Documentation/admin-guide/pm/sleep-states.rst
function standby --description "put computer in a low power mode"
  sync
  echo mem | doas tee /sys/power/state > /dev/null
end
