{ inputs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.substituters = [
    "https://nix-community.cachix.org"
    "https://hyprland.cachix.org"
  ];

  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  ];

  nix.settings.auto-optimise-store = true;
}
