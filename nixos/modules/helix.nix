{ pkgs, ... }:
{
  
  environment.systemPackages = with pkgs; [
    helix
    nixd
    nixfmt-rfc-style
  ];
}

