{ inputs, nixpkgs, ... }:

{

  imports = [
    #inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./plug/default.nix
    ./keymaps.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "neorg"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
