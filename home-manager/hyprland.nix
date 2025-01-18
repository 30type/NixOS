{ pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = false;
  xdg.configFile.hypr.source = ../modules/hypr;
}
