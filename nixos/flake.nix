{
  description = "
                            __   __      ___                 ___ 
    |\/| \ /    |\ | | \_/ /  \ /__`    |__  |     /\  |__/ |__  
    |  |  |     | \| | / \ \__/ .__/    |    |___ /~~\ |  \ |___ 
  ";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
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
          ./hosts/ideapad/configuration.nix
        ];
      }
    );
  };
}
