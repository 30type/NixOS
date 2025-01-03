{
  imports = [
    ./comment.nix
    ./lualine.nix
    ./lsp.nix
    #    ./neorg.nix
    ./neo-tree.nix
    ./startify.nix
    ./telescope.nix
    ./treesitter.nix
    ./typst.nix
  ];

  programs.nixvim = {
    colorschemes.gruvbox.enable = true;

    plugins = {
      # Lazy loading
      lz-n.enable = true;

      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      oil = {
        enable = true;
        #        lazyLoad.settings.cmd = "Oil";
      };

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
