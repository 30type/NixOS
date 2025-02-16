function nxrb --wraps='nixos-rebuild switch --use-remote-sudo --flake' --description 'alias nxrb nixos-rebuild switch --use-remote-sudo --flake'
  nixos-rebuild switch --use-remote-sudo --flake $argv
        
end
