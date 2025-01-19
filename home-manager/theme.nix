{ pkgs, ... }: 
{
  gtk = {
    enable = true;
    # cursorTheme.package = pkgs.whitesur-cursors;
    # cursorTheme.name = "Whitesur-Cursors";
    iconTheme.package = pkgs.whitesur-icon-theme;
    # iconTheme.name = "Whitesur-Icon-Theme";
    theme.package = pkgs.whitesur-gtk-theme;
    # theme.name = "Whitesur-Gtk-Theme";
  };
  qt = {
    
  };
  stylix = { 
    enable = true;
    image = ../wallpapers/car2.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  };
}
