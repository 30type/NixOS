{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
  };
}
