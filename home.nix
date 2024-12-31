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
    bash = {
      initExtra = ''
        if [[ $("${pkgs.procps}"/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          # shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish # $LOGIN_OPTION
        fi
     '';
    };
    fish = {
      enable = true;
      generateCompletions = true;
      interactiveShellInit = ''
      set fish_greeting # Disable greeting
      fastfetch
      '';
      shellAliases = {
        cdot = "cd ~/.dotfiles";
        nxrb = "nixos-rebuild switch --impure --flake ~/.dotfiles#milk-surface6";
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        vim-airline
        vim-airline-clock
        vim-airline-themes
	vim-nix
        gruvbox
        mini-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        plenary-nvim
      ];
    };
    starship = {
      enable = true;
    };
  };  
  
  home.stateVersion = "24.11";
}
