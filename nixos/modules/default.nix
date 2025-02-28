{ lib, ... }:
{
  imports = [
    ../modules/alacritty.nix
    ../modules/audio.nix
    ../modules/bluetooth.nix
    ../modules/dm.nix
    ../modules/bootloader.nix
    ../modules/fish.nix
    ../modules/fonts
    ../modules/locale.nix
    ../modules/networking.nix
    ../modules/niri.nix
    ../modules/nix.nix
    ../modules/packages.nix
    ../modules/qmk.nix
    ../modules/users.nix
  ];
}
