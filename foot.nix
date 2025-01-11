{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    theme = "tokyonight-night";
    settings = {
      main = {
        shell = "${pkgs.fish}/bin/fish";
        font = "FiraCode Nerd Font Mono:size=12, Noto Color Emoji:size=12";
      };
      scrollback = {
        lines = 100000;
      };
    };
  };
}
