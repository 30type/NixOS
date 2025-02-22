{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Disable gnome core-utils
  services.gnome.core-utilities.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  environment.gnome.excludePackages = with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
    gedit # text editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-console
    gnome-contacts
    gnome-initial-setup
    gnome-maps
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    gnome-weather
    hitori # sudoku game
    iagno # go game
    seahorse # annoying and broken ssh-askpass
    tali # poker game
    x11_ssh_askpass
    yelp # Help view
  ];
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    gnome-tweaks
  ];
}
