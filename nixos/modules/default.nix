{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./audio.nix
    ./bluetooth.nix
    ./dm.nix
    ./bootloader.nix
    ./fish.nix
    ./fonts
    ./locale.nix
    ./networking.nix
    ./niri.nix
    ./nix.nix
    ./packages.nix
    ./qmk.nix
    ./users.nix
    ./waybar.nix
  ];
}
