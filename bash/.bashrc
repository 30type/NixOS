export SHELL="fish"

if [ -z "$PS1" ]; then
  echo "this shell is not interactive"
#elif [ command -v fish ] &>/dev/null; then
else
  exec zellij
fi
