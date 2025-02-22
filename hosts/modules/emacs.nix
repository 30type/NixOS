{lib, config, pkgs, ... }:
{
  options = {
    emacs-pgtk.enable =
      lib.mkEnableOption "enables emacs-overlay";
  };

  config = lib.mkIf config.emacs-pgtk.enable {
    services.emacs.package = pkgs.emacs29-pgtk;
    services.emacs.enable = true;

    nixpkgs.overlays = [
      (import (builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
        sha256 = "sha256:17kjr12wq9lmclng1kmxzlcmp7fkpxzxpja0wazfgjkygxn2z4lh";
      }))
    ];
    environment.systemPackages = [
      pkgs.adw-gtk3
    ];
  };
}
