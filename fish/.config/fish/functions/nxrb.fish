function nxrb --wraps='nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles/nixos' --wraps='nixos-rebuild switch --flake ~/.dotfiles/nixos' --description 'alias nxrb nixos-rebuild switch --flake ~/.dotfiles/nixos'
  nixos-rebuild switch --flake ~/.dotfiles/nixos $argv
        
end
