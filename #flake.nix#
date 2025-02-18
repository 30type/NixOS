{
  description = "
                            __   __      ___                 ___ 
    |\/| \ /    |\ | | \_/ /  \ /__`    |__  |     /\  |__/ |__  
    |  |  |     | \| | / \ \__/ .__/    |    |___ /~~\ |  \ |___ 
  ";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix";
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
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
  };
}
