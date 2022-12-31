prompt_user() {
  echo '$(whoami)\033[31m@\033[00m$(hostname)'
}

prompt_directory() {
  echo '\033[34m$(pwd)\033[00m'
}

prompt() {
  status=$?
  if test status -eq 0; then
    echo '\033[32m>\033[00m'
  else
    echo '\033[31m>\033[00m'
  fi
}

root_prompt() {
  status=$?
  if test status -eq 0; then
    echo '\033[00m#'
  else
    echo '\033[31m#\033[00m'
  fi
}
