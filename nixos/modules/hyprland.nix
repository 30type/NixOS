{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hyprland;
in
{
  options.hyprland.enable = lib.mkEnableOption "enables hyprland";

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
      hyprlock
      hyprpanel
      libnotify
      rofi-wayland
      swww
    ];
    xdg.portal = {
      enable = true;
      # extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };
  };
}
