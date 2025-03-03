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
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  xdg.icons.fallbackCursorThemes = [
    "Bibata-Modern-Ice"
  ];

  programs.xwayland.enable = lib.mkForce true;
}
