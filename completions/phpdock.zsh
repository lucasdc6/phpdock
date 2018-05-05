if [[ ! -o interactive ]]; then
    return
fi

compctl -K _phpdock phpdock

_phpdock() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(phpdock commands)"
  else
    completions="$(phpdock completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}
