{
  description = "My home configuration.";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    {
      home-manager,
      nixpkgs-unstable,
      nixos-hardware,
      ...
    }: {
      nixosConfigurations.milk-surface6 = (
        nixpkgs-unstable.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            home-manager.nixosModules.home-manager
            ./configuration.nix
    	    nixos-hardware.nixosModules.microsoft-surface-pro-intel
          ];
        }
      );
    };
}
