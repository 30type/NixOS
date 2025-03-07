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
    tmux
    tree
    fastfetch
    neovim
    comma
    fzf
    ripgrep

    # gui apps
    libreoffice-qt6
    vesktop
    vial
    qutebrowser
    gimp
    flatpak

    bibata-cursors
  ];
}
