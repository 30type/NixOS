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


  programs = {
    home-manager.enable = true;
    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
    };  
    fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.kitty}/bin/kitty";
	  layer = "overlay";
	};
      };  
    };
    fish = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        plenary-nvim
        gruvbox
        mini-nvim
      ];
    };
    starship = {
      enable = true;
    };
  };  
  
  home.stateVersion = "24.11";
}
