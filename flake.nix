{
  description = "My home configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      nixvim,
      ...
    }@inputs:
    {
      nixosConfigurations.milk-surface6 = (
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit nixvim;
          };
          system = "x86_64-linux";
          modules = [
            inputs.stylix.nixosModules.stylix
            ./configuration.nix
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            inputs.nixvim.nixosModules.nixvim
          ];
        }
      );
    };
}
