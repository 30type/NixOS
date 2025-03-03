{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.wezterm;
in
{
  options.wezterm = {
    enable = lib.mkEnableOption "enables wezterm";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nerd-fonts.fira-code
      wezterm
    ];
  };
}
