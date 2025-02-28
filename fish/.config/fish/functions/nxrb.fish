function nxrb --wraps='nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles/nixos' --description 'alias nxrb nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles/nixos'
  nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles/nixos $argv
        
end
