{
  description = "
                            __   __      ___                 ___ 
    |\/| \ /    |\ | | \_/ /  \ /__`    |__  |     /\  |__/ |__  
    |  |  |     | \| | / \ \__/ .__/    |    |___ /~~\ |  \ |___ 
  ";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.desktop = (
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; };

          modules = [
            ./hosts/desktop/configuration.nix
            # inputs.hyprland.nixosModules.default
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
