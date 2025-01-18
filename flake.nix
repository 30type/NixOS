{
  description = "My home configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix";
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
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.desktop = (
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
          };
          modules = [
            {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
            ./hosts/desktop/configuration.nix
          ];
        }
      );
      nixosConfigurations.ideapad = (
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
          };
          modules = [
            inputs.stylix.nixosModules.stylix
            ./hosts/ideapad/configuration.nix
          ];
        }
      );
      homeConfigurations = {
        "l@nixos" = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ 
            ./home-manager/home.nix 
            stylix.homeManagerModules.stylix
          ];
        };
      };
    };
}
