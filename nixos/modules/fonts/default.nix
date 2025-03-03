{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (pkgs.callPackage ./dina.nix { })
      nerd-fonts.symbols-only
      fira-code
      noto-fonts
      noto-fonts-cjk-sans
      twemoji-color-font
      #undefined-medium
    ];

    fontconfig.defaultFonts = {
      monospace = [
        "FiraCode"
        "Symbols Nerd Font"
      ];
      serif = [
        "FiraCode"
        "Symbols Nerd Font"
      ];
      sansSerif = [
        "FiraCode"
        "Symbols Nerd Font"
      ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };
}
