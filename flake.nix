{
  description = "My home configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
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
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.milk-surface6 = (
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit nixvim;
          };
          modules = [
            {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
            inputs.stylix.nixosModules.stylix
            ./configuration.nix
            inputs.nixvim.nixosModules.nixvim
          ];
        }
      );
    };
}
