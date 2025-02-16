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
    ./hardware-configuration.nix
    ../modules
  ];

  networking.hostName = "ideapad"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  # stylix.image = ../../wallpapers/car2.png;
  # stylix.enable = true;
  # home-manager.extraSpecialArgs = { inherit base16; };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # $ nix search wget
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
  ];

}
