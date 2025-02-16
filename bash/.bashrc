export SHELL="fish"
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

export PATH="$HOME/.emacs.d/bin:$PATH"

if [ -z "$PS1" ]; then
  echo "this shell is not interactive"
else
  exec zellij
fi
