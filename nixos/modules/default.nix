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
    ./packages.nix
    ./qmk.nix
    ./users.nix
    ./waybar.nix
    ./wezterm.nix
  ];
  config.wezterm.enable = true;
  config.hyprland.enable = true;
}
