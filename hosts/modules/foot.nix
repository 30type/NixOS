{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      main = {
        shell = "${pkgs.fish}/bin/fish";
        font = "Undefined Medium:size=10, Noto Color Emoji:size=12";
      };
      scrollback = {
        lines = 100000;
      };
    };
  };
}
