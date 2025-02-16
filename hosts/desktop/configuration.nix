# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  base16,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../modules
  ];

  emacs-pgtk.enable =
    lib.mkOverride 10 true;
  # Enable automatic login for the user.
   services.flatpak.enable = true;

  hardware.graphics.enable = true;


  networking.hostName = "desktop"; # Define your hostname.


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  system.stateVersion = "24.11"; # Did you read the comment?
}
