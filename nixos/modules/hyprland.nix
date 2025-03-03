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
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  options.hyprland = {
    enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

      plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
        hyprbars
        hyprexpo
      ];
    };
    environment.systemPackages = with pkgs; [
      hyprlock
      # hyprlandPlugins.hyprscroller
      # hyprlandPlugins.hyprexpo
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
