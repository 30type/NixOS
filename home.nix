{ pkgs, config, inputs, ... }: 

let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs; }; 
in {
    gtk.enable = true;

    gtk.cursorTheme.package = pkgs.bibata-cursors;
    gtk.cursorTheme.name = "Bibata-Modern-Ice";

    gtk.iconTheme.package = gruvboxPlus;
    gtk.iconTheme.name = "GruvboxPlus";
  
    stylix.enable = true;

    stylix.fonts = {
      serif = {
        package = pkgs.meslo-lgs-nf;
        name = "Meslo LGS NF";
      };

      sansSerif = {
        package = pkgs.meslo-lgs-nf;
        name = "Meslo LGS NF";
      };

      monospace = {
        package = pkgs.meslo-lgs-nf;
        name = "Meslo LGS NF";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

  home.stateVersion = "24.11";

  programs = {
    home-manager.enable = true;
    kitty = {
      shellIntegration.enableFishIntegration = true;
      enable = true;
    };  
  };  
}
