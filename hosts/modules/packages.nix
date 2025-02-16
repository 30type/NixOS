{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # essentials
    cmake
    coreutils
    cachix
    fd
    gcc
    git
    gnumake
    libtool
    stow

    # shell utils
    tree
    fastfetch
    zellij
    neovim
    comma
    fzf
    ripgrep

    # gui apps
    libreoffice-qt6
    goofcord
    vial
    qutebrowser
    gimp
    flatpak
  ];
}
