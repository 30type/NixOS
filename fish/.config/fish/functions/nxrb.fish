function nxrb --wraps='nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles/nixos' --wraps='nixos-rebuild switch --flake ~/.dotfiles/nixos' --wraps='sudo nixos-rebuild switch --flake ~/.dotfiles/nixos' --description 'alias nxrb sudo nixos-rebuild switch --flake ~/.dotfiles/nixos'
  sudo nixos-rebuild switch --flake ~/.dotfiles/nixos $argv
        
end
