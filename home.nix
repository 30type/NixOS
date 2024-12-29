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
      shellIntegration.enableZshIntegration = true;
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
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
          { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }

	];
      };
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
  };  
  
  home.stateVersion = "24.11";
}
