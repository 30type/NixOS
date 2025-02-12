{ pkgs, ... }:
{
  fonts = { 
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (pkgs.nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono" ];})
      noto-fonts
      noto-fonts-cjk-sans
      twemoji-color-font
      jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      monospace = [ "JetBrains Mono" "Symbols Nerd Font" ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };
}
