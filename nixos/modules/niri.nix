{ lib, pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    foot
    niri
    rofi-wayland
    swww
    wl-clipboard-rs
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    DISPLAY = "0";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-gtk ];
  };
}
