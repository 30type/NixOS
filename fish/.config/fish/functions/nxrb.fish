function nxrb --wraps='nixos-rebuild switch --use-remote-sudo --flake' --wraps='nixos-rebuild switch --use-remote-sudo --flake .' --wraps='nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles' --description 'alias nxrb nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles'
  nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles $argv
        
end
