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
  security.rtkit.enable = true;
  services.pipewire = {
    enable  = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
