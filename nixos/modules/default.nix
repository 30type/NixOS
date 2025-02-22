{ lib, ... }:
{
  imports = [
    ../modules/audio.nix
    ../modules/bluetooth.nix
    ../modules/bootloader.nix
    ../modules/emacs.nix
    ../modules/fish.nix
    ../modules/fonts.nix
    ../modules/foot.nix
    ../modules/locale.nix
    ../modules/networking.nix
    ../modules/niri.nix
    ../modules/nix.nix
    ../modules/packages.nix
    ../modules/qmk.nix
    ../modules/users.nix
  ];

  emacs-pgtk.enable =
    lib.mkOverride 100 false;
}
