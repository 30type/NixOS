{ pkgs, ... }:

{
  wayland.windowManager.hyprland = { 
    enable = true;
    systemd.enable = false;
  };

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.whitesur-cursors;
    cursorTheme.name = "WhiteSur-Cursors";
    iconTheme.package = pkgs.whitesur-icon-theme;
    iconTheme.name = "WhiteSur-Dark";
    # theme.package = pkgs.whitesur-gtk-theme;
    # theme.name = "WhiteSur-Dark";
  };
  qt = {
   enable = true; 
   style.package = pkgs.whitesur-kde;
   style.name = "WhiteSur-Dark";
  };
  stylix = { 
    enable = true;
    image = ../wallpapers/ign_driving.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    targets.hyprland.enable = false;
    targets.tmux.enable = false;
  };

  # xdg.configFile.hypr.source = ../modules/hypr/hyprland.conf;
  # xdg.configFile.hypr.recursive = true;
  # xdg.configFile.hypr.enable = false;


  xdg.configFile."hypr/hyprland.conf".source = ../hosts/desktop/hypr/hyprland.conf;
  # xdg.configFile.hypr.recursive =true;
}
