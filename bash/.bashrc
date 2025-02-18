export SHELL="fish"
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

if [ -z "$PS1" ]; then
  echo "this shell is not interactive"
else
  exec zellij
fi
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] &&
  source "$EAT_SHELL_INTEGRATION_DIR/bash"
