{ pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;
  xdg.configFile.hyprland.source = ../hypr/hyprland.conf
}
