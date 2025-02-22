{ pkgs, ... }:
{
  fonts = { 
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      twemoji-color-font
      undefined-medium
    ];

    fontconfig.defaultFonts = {
      monospace = [ "Undefined Medium" "Symbols Nerd Font" ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };
}
