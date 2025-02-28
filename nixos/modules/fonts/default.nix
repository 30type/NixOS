{ pkgs, ... }:
{
  fonts = { 
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (pkgs.callPackage ./dina.nix { })
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      twemoji-color-font
      #undefined-medium
    ];

    fontconfig.defaultFonts = {
      monospace = [ "DinaRemasterII" "Symbols Nerd Font" ];
      serif = [ "DinaRemasterII" "Symbols Nerd Font" ];
      sansSerif = [ "DinaRemasterII" "Symbols Nerd Font" ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };
}
