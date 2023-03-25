#https://unix.stackexchange.com/questions/108699/documentation-on-less-termcap-variables
#https://unix.stackexchange.com/questions/119/colors-in-man-pages/147#147
function man --wraps=man --description='An interface to the system reference manuals'
  set -fx LESS '-sMgRF~'
  set -fx LESS_TERMCAP_mb (tput bold; tput setaf 5)
  set -fx LESS_TERMCAP_md (tput bold; tput setaf 1)
  set -fx LESS_TERMCAP_me (tput sgr0)
  set -fx LESS_TERMCAP_se (tput sgr0)
  set -fx LESS_TERMCAP_so (tput bold; tput setaf 3; tput setab 4)
  set -fx LESS_TERMCAP_ue (tput sgr0)
  set -fx LESS_TERMCAP_us (tput bold; tput setaf 12)
  command man $argv
end
