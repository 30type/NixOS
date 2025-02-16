# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  base16,
  ...
}:

{
  imports = [
    ../modules/audio.nix
    ../modules/bluetooth.nix
    ../modules/bootloader.nix
    ../modules/emacs.nix
    ../modules/fish.nix
    ../modules/fonts.nix
    ../modules/foot.nix
    ../modules/locale.nix
    ../modules/networking.nix
    ../modules/niri.nix
    ../modules/nix.nix
    ../modules/qmk.nix
    ../modules/users.nix
    ./hardware-configuration.nix
  ];

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = false;
  services.displayManager.autoLogin.user = "l";
  services.flatpak.enable = true;

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    cachix
    cmake
    comma
    coreutils
    fastfetch
    fd
    fzf
    flatpak
    gcc
    gimp
    git
    gnumake
    goofcord
    libreoffice-qt6
    libtool
    minecraft
    neovim
    nixd
    nixfmt-rfc-style
    prismlauncher
    qutebrowser
    ripgrep
    stow
    tree
    vial
    zellij
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  system.stateVersion = "24.11"; # Did you read the comment?
}
