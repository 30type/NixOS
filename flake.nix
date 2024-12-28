{
  description = "My home configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = { 
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      nixpkgs,
      nixos-hardware,
      catppuccin,
      ...
    }: {
      nixosConfigurations.milk-surface6 = (
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            home-manager.nixosModules.home-manager
            ./configuration.nix
    	    nixos-hardware.nixosModules.microsoft-surface-pro-intel
	    catppuccin.nixosModules.catppuccin
          ];
        }
      );
    };
}
