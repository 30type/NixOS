{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nyxt;
in
{
  options.nyxt.enable = lib.mkEnableOption "enables nyxt";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nyxt
    ];
  };
}
