{
  config,
  ...
}:
{
  imports = [
    ./alacritty.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./dm.nix
    ./fish.nix
    ./fonts
    ./helix.nix
    ./hyprland.nix
    ./locale.nix
    ./networking.nix
    ./niri.nix
    ./nix.nix
    ./nyxt.nix
    ./packages.nix
    ./qmk.nix
    ./users.nix
    ./wezterm.nix
  ];
  config.wezterm.enable = true;
  config.hyprland.enable = true;
  config.nyxt.enable = true;
}
